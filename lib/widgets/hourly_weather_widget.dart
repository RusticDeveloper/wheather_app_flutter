import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/controller/global_controller.dart';
import 'package:wheather_app/model/hourly_weather_data.dart';
import 'package:wheather_app/utils/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;

  HourlyWeatherWidget({super.key, required this.weatherDataHourly});
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text("Hoy", style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  hourlyList() {
    return Container(
        height: 190,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherDataHourly.hourly.length > 12
                ? 24
                : weatherDataHourly.hourly.length,
            itemBuilder: (context, index) {
              return Obx((() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0.5, 0),
                              blurRadius: 30,
                              spreadRadius: 1,
                              color: CustomColors.dividerLine.withAlpha(159))
                        ],
                        gradient: cardIndex.value == index
                            ? const LinearGradient(colors: [
                                Color.fromARGB(255, 250, 49, 76),
                                Color.fromARGB(255, 241, 144, 18)
                              ])
                            : null),
                    child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      date: weatherDataHourly.hourly[index].timeEpoch!,
                      temp: weatherDataHourly.hourly[index].tempC!,
                      icon: weatherDataHourly.hourly[index].condition!.icon!,
                      description:
                          weatherDataHourly.hourly[index].condition!.text!,
                    ),
                  ))));
            } // Listview.builder
            ));
  }
}

class HourlyDetails extends StatelessWidget {
  int index;
  int cardIndex;
  String icon;
  String description;
  int date;
  double temp;
  String formatTime(final time) {
    DateTime data = DateTime.fromMillisecondsSinceEpoch(time * 1000);
    String x = DateFormat('jm').format(data);
    return x;
  }

  HourlyDetails(
      {super.key,
      required this.index,
      required this.cardIndex,
      required this.date,
      required this.temp,
      required this.icon,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final imageUrlIndex = icon.indexOf("64x64/");
    final String iconUrl =
        "assets/weather/64x64/${icon.substring(imageUrlIndex + 6)}";

    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          formatTime(date),
          style: TextStyle(
              color: cardIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack),
        ),
      ),
      Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            iconUrl,
            height: 40,
            width: 40,
          )),
      Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            description,
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          )),
      Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp °C",
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          )),
    ]);
  }
}
