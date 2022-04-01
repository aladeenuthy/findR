import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_finder/models/data.dart';
import 'package:restaurant_finder/utils/services.dart';

class Place with ChangeNotifier {
  static const googleApiKey = "AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk";
  LatLng? _userLocation;
  NearbyResto? _nearbyResto;
  NearbyResto get nearbyResto {
    return _nearbyResto as NearbyResto;
  }

  LatLng get userLocation {
    return _userLocation as LatLng;
  }

  Future<void> fetchNearbyRestos() async {
    if (_nearbyResto != null) {
      return;
    }
    final userLocation = await getLocation();
    if (userLocation == null) {
      return;
    }
    _userLocation = userLocation;

    var isOnline = await isConnectedToInternet();
    if (!isOnline) {
      throw 'internet access required';
    }
    try {
      final url =
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=food&location=${userLocation.latitude}%2C${userLocation.longitude}&radius=10000&type=restaurant&key=$googleApiKey";
      final response = await Dio().get(url);
      List responseData = response.data['results'];
      List<Restaurant> _restaurants = responseData.map((restaurantElement) {
        return Restaurant.fromJson(restaurantElement, userLocation);
      }).toList();
      _nearbyResto = NearbyResto(
          restaurants: _restaurants,
          nextPageToken: response.data['next_page_token']);
    } on SocketException catch (_) {
      throw 'internet access required';
    } catch (_) {
      throw 'casala don burst';
    }
  }

  Future<RestaurantDetails?> fetchRestoDetails(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Creviews%2Cphotos%2Cformatted_phone_number&place_id=$placeId&key=$googleApiKey';
    try {
      final response = await Dio().get(url);
      final responseData = response.data['result'];
      RestaurantDetails restaurantDetails =
          RestaurantDetails.fromJson(responseData);
      return restaurantDetails;
    } on SocketException catch (_) {
      throw "internet access required";
    } catch (_) {
      throw 'wahala don dey';
    }
  }

  Future<Restaurant?> searchPlace(String query) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address%2Cname%2Crating%2Cphotos%2Cgeometry%2Cplace_id&type=restaurant&input=$query&inputtype=textquery&key=AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk";
    var isOnline = await isConnectedToInternet();
    if (!isOnline) {
      throw 'internet access required';
    }
    try {
      final response = await Dio().get(url);
      if (response.data['status'] == "ZERO_RESULTS") {
        return null;
      }
      final responseData = response.data['candidates'][0];
      Restaurant searchResult = Restaurant.fromJson(responseData, userLocation);
      return searchResult;
    } catch (_) {
      throw "wahala don dey";
    }
  }
}
