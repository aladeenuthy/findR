import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';

void showLoadingSpinner(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: const [
        CircularProgressIndicator(color: color2),
        SizedBox(width: 15),
        Text("Loading"),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

Future<LatLng?> getLocation() async {
  LocationPermission permission;

  // Test if location services are enabled.
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
    }
  }
  final locData = await Geolocator.getCurrentPosition();
  return LatLng(locData.latitude, locData.longitude);
}

Future<bool> isConnectedToInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
