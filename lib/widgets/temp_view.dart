import 'package:flutter/material.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list[0];
    var icon = forecastList.getIconUrl();
    var temp = forecastList.temp?.day.toStringAsFixed(0);
    var description = forecastList.weather![0].description.toUpperCase();
    print(icon);
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 34.0,
            height: 34.0,
            child: const Icon(Icons.cloud, size: 34.0,),
          ),
          const SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Text(
                '$temp °C',
                style: const TextStyle(fontSize: 54.0, color: Colors.black87),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }
}
