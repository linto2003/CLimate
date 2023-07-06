import 'package:location/location.dart';

class LocationService {
  double? long;
  double? lat;

  Future<void> getCurrentLocation() async {
    try {
      Location location = new Location();

      location.changeSettings(accuracy: LocationAccuracy.low);

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      location.onLocationChanged.listen((LocationData currentLocation) {
        _locationData = currentLocation;
      });
      _locationData = await location.getLocation();
      long = _locationData.longitude;
      lat = _locationData.latitude;
    } catch (e) {
      print(e);
    }
  }
}
