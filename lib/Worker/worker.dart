import 'package:http/http.dart';
import 'dart:convert';
class Worker
{
  String? location;
  //Constructor{}- named parameter
  Worker({this.location});

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  // method

  Future<void> getData() async
  {
    try{
      Response response = await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=1da711809be108b5476976cb9f333ffe"));
      Map data = jsonDecode(response.body);

      // Getting Temp, Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      // Getting air speed
      Map wind = data['wind'];
      double getAir_speed =wind["speed"]/0.27777777777778;

      print(data);
      //Getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      // Assigning values
      temp = getTemp.toString(); // C
      humidity = getHumidity; // %
      air_speed = getAir_speed.toString(); // km/hr
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();

    }catch(e)
    {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find data";
      main = "NA";
      icon = "09d";
    }
  }
}

