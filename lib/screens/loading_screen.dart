import 'package:climate/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climate/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void openScreen(var weatherData) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(
          weather: weatherData,
        );
      },
    ), (route) => false);
  }

  void getLocationData() async {
    openScreen(await WeatherModel().getLocationWeather());
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCircle(
          size: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
