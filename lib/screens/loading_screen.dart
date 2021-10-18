import 'dart:io';
//import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
var latitude;
  var longitude;
 @override
  void initState() {
   super.initState();
   getLocationData();
}


 void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getloactionweather();
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));

 }

@override
  Widget build(BuildContext context) {

   return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
