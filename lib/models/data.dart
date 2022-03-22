import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurant {
  final String name;
  final String photoRef;
  final String placeId;
  final double rating;
  final String vicinity;
  final LatLng location;
  const Restaurant(
      {required this.name,
      required this.photoRef,
      required this.placeId,
      required this.rating,
      required this.vicinity,
      required this.location});
  factory Restaurant.fromJson(Map json) {
    return Restaurant(
      name: json['name'],
      photoRef: json['photos'][0]['photo_reference'],
      placeId: json['place_id'],
      rating: json['rating'],
      vicinity: json['vicinity'],
      location: LatLng(double.parse(json['geometry']['location']['lat']),
          double.parse(json['geometry']['location']['lng'])),
    );
  }
}

class RestaurantDetails {
  final String phoneNumber;
  final List<String> photoRefs;
  final List reviews;
  const RestaurantDetails(
      {required this.phoneNumber,
      required this.photoRefs,
      required this.reviews});
  factory RestaurantDetails.fromJson(Map json) {
    List<Map<String, dynamic>> jsonPhotoRefs = json['photos'];
    List<Map<String, dynamic>> jsonReviews = json['reviews'];
    List<String> _photoRefs = jsonPhotoRefs.map((photoElement) {
      return photoElement["photo_reference"] as String;
    }).toList();
    List<Review> _reviews = jsonReviews.map((reviewElement) {
      return Review(
          author: reviewElement['author_name'],
          description: reviewElement['text'],
          rating: double.parse(reviewElement['rating']),
          relativeTimeDescription: reviewElement['relative_time_description']);
    }).toList();
    return RestaurantDetails(
        phoneNumber: json['formatted_phone_number'],
        photoRefs: _photoRefs,
        reviews: _reviews);
  }
}

class Review {
  final String author;
  final String description;
  final double rating;
  final String relativeTimeDescription;
  const Review(
      {required this.author,
      required this.description,
      required this.rating,
      required this.relativeTimeDescription});
}

class NearbyResto {
  List<Restaurant> restaurants;
  String pageToken;
  NearbyResto({required this.restaurants, required this.pageToken});
}
