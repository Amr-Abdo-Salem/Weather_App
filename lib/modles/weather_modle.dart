import 'package:flutter/material.dart';

class WeatherModle {
  String date;
  double temp;
  double maxTemp;
  double minTimp;
  String weatherState;
  String icon;

  WeatherModle({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTimp,
    required this.weatherState,
    required this.icon,
  });
  factory WeatherModle.fromjson(getData) {
    return WeatherModle(
      date: getData['location']['localtime'],
      temp: getData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: getData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTimp: getData['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherState: getData['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      icon: getData['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

  MaterialColor getColorAppBar() {
    if (weatherState == 'Clear' ||
        weatherState == 'Light Cloud' ||
        weatherState == 'Sunny') {
      return Colors.orange;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail' ||
        weatherState == 'Light Rain' ||
        weatherState == 'Heavy Rain0' ||
        weatherState == 'Showers') {
      return Colors.blue;
    } else if (weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherState == 'ThunderStorm' || weatherState == '') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
