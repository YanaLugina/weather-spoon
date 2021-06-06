import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_spoon/api/weather_api.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastPage extends StatefulWidget {
  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {

  late Future<WeatherForecast> forecastObject;
  final String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.list[0].weather?[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.location_city))
        ],
      ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Text('All got', style: Theme.of(context).textTheme.headline5);
                  } else {
                    return const Center(
                      child: SpinKitDoubleBounce(
                        color: Colors.greenAccent,
                        size: 100.0,
                      ),
                    );
                  }
                }
              ),
            )
          ],
        )
    );
  }
}