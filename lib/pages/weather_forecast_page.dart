import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_spoon/api/weather_api.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_spoon/pages/city_page.dart';
import 'package:weather_spoon/widgets/bottom_list_view.dart';
import 'package:weather_spoon/widgets/city_view.dart';
import 'package:weather_spoon/widgets/detail_view.dart';
import 'package:weather_spoon/widgets/temp_view.dart';

class WeatherForecastPage extends StatefulWidget {
  final bool? locationWeather;
  const WeatherForecastPage({Key? key, this.locationWeather}) : super(key: key);

  @override
  _WeatherForecastPageState createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {

  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';
  // String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather == true) {
      // forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName, isCity: false);
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: '', isCity: false);
    }

    /*forecastObject.then((weather) {
      // print(weather.list[0].weather?[0].main);
    });*/
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
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast(cityName: '', isCity: false);
            });
          },
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const CityPage();
                }));
                if (tappedName != null) {
                  _cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecast(cityName: tappedName, isCity: true);
                  forecastObject.then((weather) {
                    if (weather.list[0].weather != null) {
                      setState(() {});
                    }
                  });
                }
              },
              icon: const Icon(Icons.location_city),
          )
        ],
      ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        const SizedBox(height: 50.0,),
                        CityView(snapshot: snapshot),
                        const SizedBox(height: 50.0,),
                        TempView(snapshot: snapshot),
                        const SizedBox(height: 50.0,),
                        DetailsView(snapshot: snapshot),
                        const SizedBox(height: 50.0,),
                        BottomListView(snapshot: snapshot),
                      ],
                    );
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