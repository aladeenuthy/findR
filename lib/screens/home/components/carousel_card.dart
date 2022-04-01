import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/models/data.dart';
import 'package:restaurant_finder/screens/view%20restaurant/view_restaurant.dart';

class CarousalCard extends StatelessWidget {
  final Restaurant restaurant;
  const CarousalCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ViewRestaurant.routeName, arguments: restaurant);
      },
      child: CachedNetworkImage(
        placeholder: (context, _) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            child: const Center(
                child: CircularProgressIndicator(
              color: color2,
            )),
          );
        },
        errorWidget: (context, _, s) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    restaurant.distance + "miles away",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ));
        },
        imageUrl: restaurant.fullImageUrl,
        imageBuilder: (context, imageProvider) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    int.parse(restaurant.distance) > 1
                        ? restaurant.distance + " miles away"
                        : restaurant.distance + " mile away",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ));
        },
      ),
    );
  }
}
