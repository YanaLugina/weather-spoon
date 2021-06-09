import 'package:flutter/material.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:weather_spoon/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailsView({required this.snapshot, Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    var list = snapshot.data!.list[0];
    var pressure = (list.pressure * 0.750062).round();
    var humidity = list.humidity;
    var wind = list.speed;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters, pressure, 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
        ],
      );
  }
}
