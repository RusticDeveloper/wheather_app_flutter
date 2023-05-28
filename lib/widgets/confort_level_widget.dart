import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:wheather_app/model/current_weather_data.dart';
import 'package:wheather_app/utils/custom_colors.dart';

class ConfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ConfortLevelWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
        child: const Text(
          "Comfort Level",
          style: TextStyle(fontSize: 18),
        ), // Text
      ), // Container
      SizedBox(
        height: 180,
        child: Column(
          children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                        handlerSize: 6, trackWidth: 12, progressBarWidth: 12),
                    infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: const TextStyle(
                            letterSpacing: 0.1, fontSize: 14, height: 1.5)),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor: const Color.fromARGB(151, 19, 90, 172)
                            .withAlpha(100),
                        progressBarColors: [
                          const Color.fromARGB(255, 106, 64, 222),
                          const Color.fromARGB(255, 182, 205, 82)
                        ])), // CustomSliderColors / / Circulars\iderAppearance
              ), // sleekcircularstider
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Se Siente Como:",
                      style: TextStyle(
                          fontSize: 14,
                          color: CustomColors.textColorBlack,
                          height: 0.8,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "${weatherDataCurrent.current.feelslikeC} °C",
                      style: const TextStyle(
                          fontSize: 14,
                          color: CustomColors.textColorBlack,
                          height: 0.8,
                          fontWeight: FontWeight.w700)),
                ])),
                Container(
                  height: 25,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  color: CustomColors.cardColor,
                  width: 2,
                ),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Nubosidad:",
                      style: TextStyle(
                          fontSize: 14,
                          color: CustomColors.textColorBlack,
                          height: 0.8,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "${weatherDataCurrent.current.feelslikeC} °C",
                      style: const TextStyle(
                          fontSize: 14,
                          color: CustomColors.textColorBlack,
                          height: 0.8,
                          fontWeight: FontWeight.w700)),
                ])),
              ],
            )
          ],
        ), // Column
      )
    ]);
  }
}
