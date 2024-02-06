import 'package:flutter/material.dart';

class HourlyWeatherForecast extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyWeatherForecast(
      {super.key,
      required this.time,
      required this.temperature,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Icon(
              icon,
              size: 36,
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              temperature,
            ),
          ],
        ),
      ),
    );
  }
}
