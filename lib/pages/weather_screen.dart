import 'dart:ui';

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
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
              )
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--------------------------------------Main card--------------------------------------//
                Card(
                  elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Center(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8,sigmaY: 8),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              //------------Top text------------//
                              Text(
                                '27°C',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8 ,),
                              //------------Cloud Icon------------//
                              Icon(
                                Icons.cloud,
                                size: 80,
                              ),
                              SizedBox(height: 16 ,),
                              //------------Bottom text------------//
                              Text(
                                'Rain',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                const Text(
                  'Weather Forecast',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
                ),

                const SizedBox(height: 8,),

                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyWeatherForecast(),
                      HourlyWeatherForecast(),
                      HourlyWeatherForecast(),
                      HourlyWeatherForecast(),
                      HourlyWeatherForecast(),
                    ],
                  ),
                ),

                const SizedBox(height: 30,),

                const Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
                ),

                const SizedBox(height: 10,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Icon(Icons.water_drop,size: 34,),
                        SizedBox(height: 12,),
                        Text('Humidity',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 8,),
                        Text('98',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.air,size: 34,),
                        SizedBox(height: 12,),
                        Text('Wind Speed',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 8,),
                        Text('7.67',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.beach_access,size:34,),
                        SizedBox(height: 12,),
                        Text('Pressure',style: TextStyle(fontSize: 18),),
                        SizedBox(height: 8,),
                        Text('1006',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                )



              ],
            ),
          ),

        )
    );
  }
}

class HourlyWeatherForecast extends StatelessWidget {
  const HourlyWeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        child: const Column(
          children: [
            Text(
              '04:00',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8,),

            Icon(Icons.cloud,size: 36,),

            SizedBox(height: 8,),

            Text(
              '320.16',

            ),
          ],
        ),
      ),

    );
  }
}
