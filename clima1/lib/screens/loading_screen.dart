import 'package:clima1/screens/location_screen.dart';
import 'package:clima1/servies/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima1/servies/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '7a46d8361a71e00065a0dc762c469ded';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double lontitude = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    lontitude = location.longtitude;
    networkHelp netHelp = networkHelp(
        'https://api.openweathermap.org/data/2.5/weather?lat={$location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');
    var weatherData = await netHelp.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
