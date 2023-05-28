class WeatherDataHourly {
  final List<Hourly> hourly;
  WeatherDataHourly({required this.hourly});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      WeatherDataHourly(
          hourly: List<Hourly>.from(json['forecast']['forecastday'][0]['hour']
              .map((e) => Hourly.fromJson(e))));
}

class Hourly {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  Condition? condition;
  double? uv;

  Hourly({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.condition,
    this.uv,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        timeEpoch: json['time_epoch'] as int?,
        time: json['time'] as String?,
        tempC: (json['temp_c'] as double?),
        tempF: (json['temp_f'] as double?),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: json['uv'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'temp_c': tempC,
        'temp_f': tempF,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}

// condition for each hourly state for the wheater

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
