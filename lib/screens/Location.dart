import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/widgets/Details.dart';
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
String? desc;

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
    desc = weatherData['weather'][0]['description'];
    city = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAE0),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.locationDot,
              size: 20.0,
            ),
            Text(
              city!,
              style: appBarText,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
            width: double.infinity,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.73,
            decoration: BoxDecoration(
              color: const Color(0xFFFFCD00),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Text(
                    "${desc![0].toUpperCase()}${desc!.substring(1).toLowerCase()}",
                    style: descText),
                Text(
                  '$temperature°',
                  style: tempText,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.043,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color(0xFF1D71F2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                details(
                  icon: CupertinoIcons.wand_stars_inverse,
                  type: "Pressure",
                ),
                details(
                  icon: CupertinoIcons.wand_stars_inverse,
                  type: "Pressure",
                ),
                details(
                  icon: CupertinoIcons.wand_stars_inverse,
                  type: "Pressure",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
