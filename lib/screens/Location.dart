import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/City.dart';
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
String? icon;
int? press;
int? humid;
double? speed;

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      temperature = weatherData['main']['temp'].toInt();
      condition = weatherData['weather'][0]['id'];
      desc = weatherData['weather'][0]['description'];
      city = weatherData['name'];
      icon = weatherData['weather'][0]['icon'];
      press = weatherData['main']['pressure'];
      humid = weatherData['main']['humidity'];
      speed = weatherData['wind']['speed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.locationArrow),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () async {
              var typedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return City();
                  },
                ),
              );
              print(typedName);
            },
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(FontAwesomeIcons.locationDot, size: 20),
              ),
              TextSpan(text: city!, style: appBarText),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
            width: double.infinity,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.73,
                height: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xFFFFCD00).withOpacity(0.5),
                        offset: const Offset(0, 25),
                        blurRadius: 3,
                        spreadRadius: -20)
                  ],
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
              Positioned(
                left: -20,
                right: -20,
                bottom: -40,
                child: Image.network(
                  "http://openweathermap.org/img/wn/$icon@2x.png",
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.height * 0.1150,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.053,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFFE4A896).withOpacity(0.5),
                    offset: const Offset(0, 25),
                    blurRadius: 3,
                    spreadRadius: -20)
              ],
              color: const Color(0xFFE4A896),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                details(
                  value: press.toString() + ' hPa',
                  icon: FontAwesomeIcons.arrowDown,
                  type: "Pressure",
                ),
                details(
                  value: humid.toString() + ' %',
                  icon: FontAwesomeIcons.droplet,
                  type: "Humidity",
                ),
                details(
                  value: speed.toString() + ' m/s',
                  icon: FontAwesomeIcons.wind,
                  type: "Wind",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
