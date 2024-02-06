import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/pages/secrets.dart';
import 'dart:ui';
import 'package:weather_icons/weather_icons.dart';
import 'AdditionalInfoItem.dart';
import 'HourlyWeatherForecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  Future getCurrentWeather() async {
    try {
      String cityName = 'London,uk';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'an unexpected error occurred ...';
      }

      // temp = data['list'][0]['main']['temp'];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            // fontSize: 28
          ),
        ),

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.black26,
                Colors.black54,
              ],
            ),
          ),
        ),
        centerTitle: true,
        // backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather() ,
        builder: (context,snapshot) {

          return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--------------------------------------Main card started--------------------------------------//
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            //------------Top text------------//
                            Text(
                              '$temp K',
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            //------------Cloud Icon------------//
                            const Icon(
                              Icons.cloud,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            //------------Bottom text------------//
                            const Text(
                              'Rain',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //--------------------------------------Main card ended--------------------------------------//

              const SizedBox(
                height: 30,
              ),

              const Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyWeatherForecast(
                      time: '01:00',
                      icon: WeatherIcons.day_sunny,
                      temperature: '28.3°C',
                    ),
                    HourlyWeatherForecast(
                      time: '02:00',
                      icon: WeatherIcons.day_cloudy,
                      temperature: '25.8°C',
                    ),
                    HourlyWeatherForecast(
                      time: '03:00',
                      icon: WeatherIcons.day_sleet_storm,
                      temperature: '22.8°C',
                    ),
                    HourlyWeatherForecast(
                      time: '04:00',
                      icon: WeatherIcons.rain,
                      temperature: '22.3°C',
                    ),
                    HourlyWeatherForecast(
                      time: '05:00',
                      icon: WeatherIcons.cloudy_gusts,
                      temperature: '23.8°C',
                    ),
                    HourlyWeatherForecast(
                      time: '06:00',
                      icon: WeatherIcons.night_alt_cloudy,
                      temperature: '24.2°C',
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    lable: 'Humidity',
                    value: '98',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    lable: 'Wind Speed',
                    value: '7.67',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    lable: 'Pressure',
                    value: '1006',
                  ),
                ],
              )
            ],
          ),
        );
        },
      ),
    ));
  }
}
