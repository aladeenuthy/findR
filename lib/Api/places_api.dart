import 'package:flutter/material.dart';
import 'package:restaurant_finder/utils/services.dart';

class PlacesApi {
  static const googleApiKey = "AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk";
  static Future<void> fetchNearbyRestos() async {
    final userLocation = await getLocation();
    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=food&location=${userLocation!.latitude}%2C${userLocation!.longitude}&radius=1500&type=restaurant&key=$googleApiKey";
  }
}
