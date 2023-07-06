import 'package:climate/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climate/utilities/constants.dart';
import 'package:climate/services/audio.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weather});
  final weather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  var location;
  var country;
  String? warning;
  var lastupdate;
  var temp1;
  int temp = 0;
  var icon;
  var code;
  WeatherModel weatherModel = WeatherModel();
  AudioSetter audio = AudioSetter();

  void initState() {
    super.initState();
    updateUI(widget.weather);
  }

  void updateUI(dynamic weather) {
    location = weather['location']['name'];
    country = weather['location']['country'];
    double temperature = weather['current']['temp_c'];
    temp = temperature.toInt();
    icon = weather['current']['condition']['icon'];
    warning = weather['current']['condition']['text'];
    lastupdate = weather['current']['last_updated'];

    audio.urlGetter(warning);
    audio.playAudio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();

                      setState(() {
                        updateUI(weatherData);
                      });
                    },
                    child: Icon(
                      Icons.location_on,
                      size: 40.0,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'You are currently in $country',
                        style: kCountryTextStyle,
                      ),
                      Text(
                        'last updated on $lastupdate',
                        style: kUpdateTextStyle,
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 45.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temp°',
                    style: kTempTextStyle,
                  ),
                  Image(image: NetworkImage('https:$icon'))
                ],
              ),
              SizedBox(
                height: 70.0,
              ),
              TextButton(
                onPressed: () {
                  audio.playAudio();
                },
                child: Text(
                  "$warning in $location !",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
