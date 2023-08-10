// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';

// ignore: must_be_immutable,
class SearchScreen extends StatelessWidget {
  SearchScreen();
  VoidCallback? updateUi;
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: TextField(
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 25,
                ),
                border: const OutlineInputBorder(),
                label: const Text('Search'),
                hintText: 'Enter a City',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () async {
                    BlocProvider.of<WeatherCubit>(context)
                        .GetWeatherFromCubit(cityName: cityName!);
                    BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
                    Navigator.of(context).pop();
                  },
                ),
              ),
              onChanged: (Value) {
                cityName = Value;
              },
              onSubmitted: (value) async {
                cityName = value;
                BlocProvider.of<WeatherCubit>(context)
                    .GetWeatherFromCubit(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName!;
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
