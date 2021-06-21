import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_spoon/api/weather_api.dart';
import 'package:weather_spoon/pages/weather_forecast_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  void getLocationData() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast(cityName: '', isCity: false);

    if (weatherInfo == null) {
      print('WeatherInfo was null: $weatherInfo');
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const WeatherForecastPage(locationWeather: true);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100.0
        ),
      )
    );
  }
}
