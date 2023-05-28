import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/model/forecast_weather_data.dart';
import 'package:wheather_app/utils/custom_colors.dart';

class ForecastdayWeatherWidget extends StatelessWidget {
  final WeatherDataForecastDay weatherDataForecastDay;
  const ForecastdayWeatherWidget(
      {super.key, required this.weatherDataForecastDay});

// time formatting
  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat("EEEE").format(time);
    return x;
  }

// image url
  String getIcom(final iconUrl) {
    final imageUrlIndex = iconUrl.indexOf("64x64/");
    final String url =
        "assets/weather/64x64/${iconUrl.substring(imageUrlIndex + 6)}";
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: CustomColors.dividerLine.withAlpha(150),
          borderRadius: BorderRadius.circular(20)), // BoxDecoration
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Siguientes Días",
              style:
                  TextStyle(color: CustomColors.textColorBlack, fontSize: 17),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: weatherDataForecastDay.forecastday.length > 7
              ? 7
              : weatherDataForecastDay.forecastday.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                height: 95,
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(weatherDataForecastDay
                            .forecastday[index].dateEpoch),
                        style: const TextStyle(
                            color: CustomColors.textColorBlack,
                            fontSize: 13), // TextStyle
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(getIcom(weatherDataForecastDay
                          .forecastday[index].day?.condition?.icon)),
                    ),
                    Text(
                        "${weatherDataForecastDay.forecastday[index].day?.avgtempC}°C/ ${weatherDataForecastDay.forecastday[index].day?.dailyChanceOfRain}%/ ${weatherDataForecastDay.forecastday[index].day?.uv} UVI"),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ]);
          }),
    );
  }
}


// Text(getDay(weatherDataForecastDay.forecastday[index].dateEpoch))