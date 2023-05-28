import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_app/controller/global_controller.dart';
import 'package:wheather_app/utils/custom_colors.dart';
import 'package:wheather_app/widgets/confort_level_widget.dart';
import 'package:wheather_app/widgets/current_weather_widget.dart';
import 'package:wheather_app/widgets/forecastday_weather_widget.dart';
import 'package:wheather_app/widgets/header_widget.dart';
import 'package:wheather_app/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue
                ? Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/clouds.png',
                            height: 200,
                            width: 200,
                          ),
                          const CircularProgressIndicator()
                        ]),
                  )
                : ListView(scrollDirection: Axis.vertical, children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),
                    // for current weather data
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                    HourlyWeatherWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().getHourlyWeather(),
                    ),
                    ForecastdayWeatherWidget(
                      weatherDataForecastDay: globalController
                          .getWeatherData()
                          .getForecastDayWeather(),
                    ),
                    Container(
                      height: 1,
                      color: CustomColors.dividerLine,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConfortLevelWidget(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    )
                  ]))));
  }
}
