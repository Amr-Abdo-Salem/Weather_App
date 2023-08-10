// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:weatherapp/cubit/weather_state.dart';
import 'package:weatherapp/modles/weather_modle.dart';
import 'package:weatherapp/services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherLoadingData());
  String? cityName;
  WeatherService weatherService;
  WeatherModle? weatherModle;
  // ignore: non_constant_identifier_names
  void GetWeatherFromCubit({required String cityName}) async {
    emit(WeatherLoadingData());
    try {
      weatherModle = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessLoadingData());
    } on Exception catch (e) {
      emit(WeatherFuilerLoadingData());
      print(e);
    }
  }
}
