import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget destroyed");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Delhi", "Haldwani","Mumbai","Gujarat","Punjab", "London"];
    final random = Random();
    var city = city_name[random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)!.settings.arguments as Map;
    String? temp = ((info['temp_value']).toString());
    String? air = ((info['air_speed_value']).toString());
    if(temp == "NA"){
      print("NA");
    }else{
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['air_speed_value']).toString()).substring(0, 4);
    }
    String? icon = info['icon_value'];
    String? getCity = info['city_value'];
    String? hum = info['hum_value'];
    String? des = (info['desc_value']);
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.blue[200] ?? Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // stops:
                  //     [
                  //       0.5,
                  //       0.9
                  //     ],
                  colors: [
                    Colors.blue[800] ?? Colors.blue,
                    Colors.blue[300] ?? Colors.blue,
                  ]),
            ),
            child: Column(
              children: [
                Container(
                  //Search Wala Container

                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == ""){
                            print("Blank Search");
                          }else{
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText" : searchController.text,
                            });
                          }
                        },
                        child: Container(
                            child: const Icon(Icons.search),
                            margin: const EdgeInsets.fromLTRB(3,0,7,0,)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city",),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                             Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(
                                  "$des",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $getCity",
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.5)),
                          margin:
                              const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          padding: const EdgeInsets.all(26),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(WeatherIcons.thermometer),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$temp",
                                    style: const TextStyle(fontSize: 70),
                                  ),
                                  const Text(
                                    "C",
                                    style: TextStyle(fontSize: 30),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_light_wind),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$air",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$hum",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 120,),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Kamini"),
                      Text("Data provided by Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
