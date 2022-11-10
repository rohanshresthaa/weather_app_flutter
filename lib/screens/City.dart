import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utilities/Constants.dart';

class City extends StatefulWidget {
  const City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              style: hintText,
              onChanged: (value) {
                cityName = value;
              },
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.pop(context, cityName);
                    },
                    child: const Icon(FontAwesomeIcons.magnifyingGlass)),
                filled: true,
                fillColor: const Color(0xFF3e3b51),
                hintText: 'Enter City Name',
                hintStyle: hintText,
                icon: const Icon(
                  FontAwesomeIcons.city,
                  color: Color(0xFFE3F4FE),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
