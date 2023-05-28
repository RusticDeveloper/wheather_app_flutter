import 'condition.dart';

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  int? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  int? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  int? totalsnowCm;
  double? avgvisKm;
  int? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  int? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        maxtempF: (json['maxtemp_f'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        mintempF: (json['mintemp_f'] as num?)?.toDouble(),
        avgtempC: json['avgtemp_c'] as int?,
        avgtempF: (json['avgtemp_f'] as num?)?.toDouble(),
        maxwindMph: (json['maxwind_mph'] as num?)?.toDouble(),
        maxwindKph: json['maxwind_kph'] as int?,
        totalprecipMm: (json['totalprecip_mm'] as num?)?.toDouble(),
        totalprecipIn: (json['totalprecip_in'] as num?)?.toDouble(),
        totalsnowCm: json['totalsnow_cm'] as int?,
        avgvisKm: (json['avgvis_km'] as num?)?.toDouble(),
        avgvisMiles: json['avgvis_miles'] as int?,
        avghumidity: json['avghumidity'] as int?,
        dailyWillItRain: json['daily_will_it_rain'] as int?,
        dailyChanceOfRain: json['daily_chance_of_rain'] as int?,
        dailyWillItSnow: json['daily_will_it_snow'] as int?,
        dailyChanceOfSnow: json['daily_chance_of_snow'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: json['uv'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'maxtemp_f': maxtempF,
        'mintemp_c': mintempC,
        'mintemp_f': mintempF,
        'avgtemp_c': avgtempC,
        'avgtemp_f': avgtempF,
        'maxwind_mph': maxwindMph,
        'maxwind_kph': maxwindKph,
        'totalprecip_mm': totalprecipMm,
        'totalprecip_in': totalprecipIn,
        'totalsnow_cm': totalsnowCm,
        'avgvis_km': avgvisKm,
        'avgvis_miles': avgvisMiles,
        'avghumidity': avghumidity,
        'daily_will_it_rain': dailyWillItRain,
        'daily_chance_of_rain': dailyChanceOfRain,
        'daily_will_it_snow': dailyWillItSnow,
        'daily_chance_of_snow': dailyChanceOfSnow,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}
