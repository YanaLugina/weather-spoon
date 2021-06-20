import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_spoon/pages/weather_forecast_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  void getLocationData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();

    if (permission == 'denied' || permission == 'deniedForever') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const WeatherForecastPage();
      }));
    }

    if (permission == 'always' && isLocationServiceEnabled == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const WeatherForecastPage(locationWeather: true);
      }));
    }

    if (permission == 'always' && isLocationServiceEnabled == false) {
      await Geolocator.openLocationSettings();
      setState(() {
        //
      });
    }

    if (permission == 'whileInUse') {
      await Geolocator.openLocationSettings();
      setState(() {
        //
      });
    }

    /*var weatherInfo = await WeatherApi()
        .fetchWeatherForecast(cityName: '', isCity: false);

    if (weatherInfo == null) {
      print('WeatherInfo was null: $weatherInfo');
      return;
    }*/

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const WeatherForecastPage(locationWeather: true);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
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
