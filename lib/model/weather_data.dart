import 'package:wheather_app/model/current_weather_data.dart';
import 'package:wheather_app/model/forecast_weather_data.dart';
import 'package:wheather_app/model/hourly_weather_data.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataForecastDay? forecastday;

  WeatherData([this.current, this.hourly, this.forecastday]);
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataForecastDay getForecastDayWeather() => forecastday!;
}
