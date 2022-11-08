import 'package:flutter/material.dart';
import 'package:weather_app/utilities/Constants.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

int? temperature;
int? condition;
String? city;

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    temperature = weatherData['main']['temp'].toInt();
    condition = weatherData['weather'][0]['id'];
    city = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(city!),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 60.0,
            width: double.infinity,
          ),
          Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV6zkVAGtitKaro3LdL37oNY3mZowAuM0Db_QKEVc4fheeQUlvmBkHik0q1GIPjQExV8Q&usqp=CAU'),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            '$temperature°',
            style: tempText,
          ),
          Text(condition.toString()),
        ],
      ),
    );
  }
}
