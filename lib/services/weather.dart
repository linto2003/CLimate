import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

class WeatherModel {
  String apiKey = '79f93b0c47684a20a7c182054231306';
  late double latitude;
  late double longitude;

  Future<dynamic> getLocationWeather() async {
    LocationService locate = LocationService();

    await locate.getCurrentLocation();
    longitude = locate.long!;
    latitude = locate.lat!;

    NetworkHelper net = NetworkHelper(
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$latitude,$longitude');
    var weather = await net.getData();
    return weather;
  }

  void getWarning() {}
}
