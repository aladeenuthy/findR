import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_finder/utils/services.dart';

class Restaurant {
  final String name;
  final String photoRef;
  final String placeId;
  final double rating;
  final String vicinity;
  final LatLng location;
  final String distance;
  const Restaurant(
      {required this.name,
      required this.photoRef,
      required this.placeId,
      required this.rating,
      required this.vicinity,
      required this.location,
      required this.distance,
      });
  String get fullImageUrl {
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoRef&key=AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk';
  }

  factory Restaurant.fromJson(Map json, LatLng userLocation) {
    return Restaurant(
      name: json['name'] ?? "",
      photoRef:
          json['photos'] == null ? '' : json['photos'][0]['photo_reference'],
      placeId: json['place_id'] ?? "",
      rating: double.parse(json['rating'].toString()),
      vicinity: json['vicinity'] ?? json['formatted_address'] ?? '',
      location: LatLng(json['geometry']['location']['lat'],
          json['geometry']['location']['lng']),
      distance: calculateDistance(userLocation.latitude, userLocation.longitude,json['geometry']['location']['lat'],
            json['geometry']['location']['lng']).round().toString()
    );
  }
}

class RestaurantDetails {
  final String phoneNumber;
  final List<String> photoRefs;
  final List<Review> reviews;
  const RestaurantDetails(
      {required this.phoneNumber,
      required this.photoRefs,
      required this.reviews});
  factory RestaurantDetails.fromJson(Map json) {
    List jsonPhotoRefs = json['photos'] ?? [];
    List jsonReviews = json['reviews'] ?? [];
    List<String> _photoRefs = [];
    List<Review> _reviews = [];
    if (jsonPhotoRefs.isNotEmpty) {
      _photoRefs = jsonPhotoRefs.map((photoElement) {
        return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=${photoElement["photo_reference"]}&key=AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk';
      }).toList();
    }
    if (jsonReviews.isNotEmpty) {
      _reviews = jsonReviews.map((reviewElement) {
        return Review(
            author: reviewElement['author_name'],
            description: reviewElement['text'],
            rating: double.parse(reviewElement['rating'].toString()),
            relativeTimeDescription:
                reviewElement['relative_time_description']);
      }).toList();
    }

    return RestaurantDetails(
        phoneNumber: json['formatted_phone_number'] ?? '',
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
  String nextPageToken;
  NearbyResto({required this.restaurants, required this.nextPageToken});
}
