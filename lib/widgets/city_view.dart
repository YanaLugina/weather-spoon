import 'package:flutter/material.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:weather_spoon/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list[0].dt;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList! * 1000);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
              '$city, $country',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.black87
          )),
          Text(
              Util.getFormattedDate(formattedDate),
              style: const TextStyle(
                  fontSize: 15.0
              )),
        ],
      ),
    );
  }
}
