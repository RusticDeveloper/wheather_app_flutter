class WeatherDataCurrent {
  final Current current;
  WeatherDataCurrent({required this.current});
  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      WeatherDataCurrent(current: Current.fromJson(json['current']));
}

class Current {
  double? tempC;
  double? tempF;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? uv;

  Current({
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.windKph,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        tempC: json['temp_c'] as double?,
        tempF: json['temp_f'] as double?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windMph: (json['wind_mph'] as double?),
        windKph: (json['wind_kph'] as double?),
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as double?),
        uv: json['uv'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'temp_c': tempC,
        'temp_f': tempF,
        'condition': condition?.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'uv': uv,
      };
}

// condition model of the request for wheater api

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
