import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({super.key});
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  String? city = "Delhi";
  String? temp;
  String? hum;
  String? air_speed;
  String? desc;
  String? main;
  String? icon;



  void startApp(String? city) async
  {
    Worker instance = Worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments : {

        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "desc_value" : desc,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,
      });

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    startApp(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search =  ModalRoute.of(context)!.settings.arguments as Map?;
    if(search?.isNotEmpty ?? false)
    {
      city = search!["searchText"];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/weather_app.webp",height : 230, width : 230,),
            const Text("Mausam App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),),
            const SizedBox(height: 10,),
            const Text("Made by Kamini",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
                color: Colors.white
            ),),
        const SizedBox(height : 30,),
        const SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
          ],
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
