// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/weather_cubit.dart';
import 'package:weatherapp/cubit/weather_state.dart';
import 'package:weatherapp/modles/weather_modle.dart';
import 'package:weatherapp/screens/search_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  WeatherModle? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessLoadingData) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .getColorAppBar(),
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .getColorAppBar()[600]!,
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .getColorAppBar()[500]!,
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .getColorAppBar()[400]!,
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .getColorAppBar()[200]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    BlocProvider.of<WeatherCubit>(context).cityName!,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Update: ${BlocProvider.of<WeatherCubit>(context).weatherModle!.date}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'http:${BlocProvider.of<WeatherCubit>(context).weatherModle!.icon}',
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        '${BlocProvider.of<WeatherCubit>(context).weatherModle!.temp}',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp: ${BlocProvider.of<WeatherCubit>(context).weatherModle!.maxTemp.toInt()}',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'minTemp: ${BlocProvider.of<WeatherCubit>(context).weatherModle!.minTimp.toInt()}',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    BlocProvider.of<WeatherCubit>(context)
                        .weatherModle!
                        .weatherState,
                    style: const TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          } else if (state is WeatherFuilerLoadingData) {
            return const Center(
              child: Text('Fuiler From Data '),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'There is no Weather 😔 Start \n Search now 🔍 ',
                    style: TextStyle(
                      fontSize: 30,
                      height: 2,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      // ?
      // :
    );
  }
}
