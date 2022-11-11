import 'package:weather_app/services/Networking.dart';

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=1937f6e55e21a1635b9947eb7793c99d&units=metric';
    Api api = Api(url);
    var weatherData = await api.getData();
    return weatherData;
  }
}
