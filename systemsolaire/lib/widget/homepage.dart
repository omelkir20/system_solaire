import 'package:flutter/material.dart';
import 'package:systemsolaire/planetCards/jupiter.dart';
import 'package:systemsolaire/planetCards/mars.dart';
import 'package:systemsolaire/planetCards/terre.dart';
import 'package:systemsolaire/planetCards/venus.dart';

import '../planetCards/mercure.dart';
import '../planetCards/neptune.dart';
import '../planetCards/saturne.dart';
import '../planetCards/solar_system.dart';
import '../planetCards/uranus.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Text(
                  '',
                  //'النظام\nالشمسي'
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              height: 565,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SolarSystem(),
                  Mercure(),
                  Venus(),
                  Terre(),
                  Mars(),
                  Jupiter(),
                  Saturne(),
                  Uranus(),
                  Neptune(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
