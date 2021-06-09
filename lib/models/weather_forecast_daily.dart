import 'package:weather_spoon/utilities/constants.dart';

class WeatherForecast {
  City? city;
  late String cod;
  late double message;
  late int cnt;
  late List<WeatherList> list;

  WeatherForecast({required this.city, required this.cod, required this.message, required this.cnt, required this.list});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <WeatherList>[];
      json['list'].forEach((v) {
        list.add(WeatherList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city?.toJson();
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    data['list'] = list.map((v) => v.toJson()).toList();
    return data;
  }
}

class City {
  late int id;
  late String name;
  Coord? coord;
  late String country;
  late int population;
  late int timezone;

  City(
      {required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['coord'] = coord?.toJson();
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}

class Coord {
  late double lon;
  late double lat;

  Coord({required this.lon, required this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon']?.toDouble();
    lat = json['lat']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class WeatherList {
  late int dt;
  late int sunrise;
  late int sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  late int pressure;
  late int humidity;
  List<Weather>? weather;
  late double speed;
  late int deg;
  late double gust;
  late int clouds;
  late double pop;
  late double? rain;

  WeatherList(
      {required this.dt,
        required this.sunrise,
        required this.sunset,
        required this.temp,
        required this.feelsLike,
        required this.pressure,
        required this.humidity,
        required this.weather,
        required this.speed,
        required this.deg,
        required this.gust,
        required this.clouds,
        required this.pop,
        required this.rain});

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = (json['temp'] != null ? Temp.fromJson(json['temp']) : null)!;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
    clouds = json['clouds'];
    pop = json['pop']?.toDouble();
    rain = json['rain']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp?.toJson();
    data['feels_like'] = feelsLike?.toJson();
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['weather'] = weather?.map((v) => v.toJson()).toList();
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['rain'] = rain;
    return data;
  }

  String getIconUrl() {
    return Constants.WEATHER_IMAGES_URL + (weather != null ? weather![0].icon : '04d') + '.png';
  }
}

class Temp {
  late double day;
  late double min;
  late double max;
  late double night;
  late double eve;
  late double morn;

  Temp({required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day']?.toDouble();
    min = json['min']?.toDouble();
    max = json['max']?.toDouble();
    night = json['night']?.toDouble();
    eve = json['eve']?.toDouble();
    morn = json['morn']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class FeelsLike {
  late double day;
  late double night;
  late double eve;
  late double morn;

  FeelsLike({required this.day,
    required this.night,
    required this.eve,
    required this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day']?.toDouble();
    night = json['night']?.toDouble();
    eve = json['eve']?.toDouble();
    morn = json['morn']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class Weather {
  late int id;
  late String main;
  late String description;
  late String icon;

  Weather({required this.id, required this.main, required this.description, required this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
