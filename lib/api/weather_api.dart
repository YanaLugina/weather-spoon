import 'dart:convert';
import 'dart:developer';

import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:weather_spoon/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_spoon/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      { required String cityName , bool? isCity}
      ) async {

    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;

    if (isCity == true) {
      var queryParams = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
      parameters = queryParams;
    } else {
      var queryParams = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParams;
    }


    
    var uri = Uri.https(
        Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH,
        parameters
    );

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('responce: ${response.body}');

    if(response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}