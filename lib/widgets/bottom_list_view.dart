import 'package:flutter/material.dart';
import 'package:weather_spoon/models/weather_forecast_daily.dart';
import 'package:weather_spoon/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({required this.snapshot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140.0,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160.0,
                color: Colors.black87,
                child: forecastCard(snapshot, index),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 8.0,),
              itemCount: snapshot.data!.list.length,
          ),
        ),
      ],
    );
  }
}
