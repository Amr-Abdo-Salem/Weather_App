import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/screens/home_screen.dart';
import 'package:weatherapp/services/weather_services.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return WeatherCubit(
          WeatherService(),
        );
      },
      child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModle == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModle!
                    .getColorAppBar(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
