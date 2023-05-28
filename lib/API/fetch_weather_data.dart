import 'dart:convert';

import 'package:wheather_app/model/current_weather_data.dart';
import 'package:wheather_app/model/forecast_weather_data.dart';
import 'package:wheather_app/model/hourly_weather_data.dart';
import 'package:wheather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/API/api_key.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiurl(lat, long)),
        headers: {'X-RapidAPI-Key': apiKey, 'X-RapidAPI-Host': apiHost});
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataForecastDay.fromJson(jsonString));

    return weatherData!;
  }
}

String apiurl(lattitude, longitude) {
  String url =
      "https://weatherapi-com.p.rapidapi.com/forecast.json?q=$lattitude,$longitude&days=3&lang=es";
  return url;
}
