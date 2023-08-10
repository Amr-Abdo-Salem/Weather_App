import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/modles/weather_modle.dart';

class WeatherService {
  get context => BuildContext;

  Future<WeatherModle?> getWeather({required String cityName}) async {
    WeatherModle? weather;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1/';
      String apiKey = '6a775c96e07049dbba2174809232207';
      Uri url =
          Uri.parse('${baseUrl}forecast.json?key=$apiKey&q=$cityName&days=5');
      http.Response response = await http.get(url);
      Map<String, dynamic> getData = jsonDecode(response.body);
      weather = WeatherModle.fromjson(getData);
    } catch (e) {
      Future.delayed(
        const Duration(
          milliseconds: 10,
        ),
      );
    }

    return weather;
  }
}
