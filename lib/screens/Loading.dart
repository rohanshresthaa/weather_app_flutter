import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/GetLocation.dart';
import 'package:weather_app/services/Networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    Api api = Api(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=1937f6e55e21a1635b9947eb7793c99d&units=metric');
    var weatherData = await api.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
