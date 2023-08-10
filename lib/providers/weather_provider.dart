import 'package:flutter/material.dart';
import 'package:weatherapp/modles/weather_modle.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModle? _weatherData;
  String? cityName;
  // ignore: non_constant_identifier_names
  set WeatherData(WeatherModle? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModle? get weatherData => _weatherData;
}
