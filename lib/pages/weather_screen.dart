import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:
          AppBar(

            title: const Text(
                'Weather App',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                // fontSize: 28
              ),
            ),

            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black54,
                    ]
                    )
                )
            ),
            centerTitle: true,
            // backgroundColor: Colors.blue,
          ),
        )
    );
  }
}
