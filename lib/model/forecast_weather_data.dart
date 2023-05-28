class WeatherDataForecastDay {
  final List<Forecastday> forecastday;
  WeatherDataForecastDay({required this.forecastday});

  factory WeatherDataForecastDay.fromJson(Map<String, dynamic> json) =>
      WeatherDataForecastDay(
          forecastday: List<Forecastday>.from(json['forecast']['forecastday']
              .map((e) => Forecastday.fromJson(e))));
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: (json['forecastday'] as List<dynamic>?)
            ?.map((e) => Forecastday.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'forecastday': forecastday?.map((e) => e.toJson()).toList(),
      };
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;

  Forecastday({this.date, this.dateEpoch, this.day});

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json['date'] as String?,
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? null
            : Day.fromJson(json['day'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day?.toJson(),
      };
}

// Day model to format the response of the weather api

class Day {
  double? avgtempC;
  double? avgtempF;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  Condition? condition;
  double? uv;

  Day({
    this.avgtempC,
    this.avgtempF,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        avgtempC: json['avgtemp_c'] as double?,
        avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
        dailyWillItRain: json['daily_will_it_rain'] as int?,
        dailyChanceOfRain: json['daily_chance_of_rain'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: json['uv'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}

// condition model of the response
class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}
