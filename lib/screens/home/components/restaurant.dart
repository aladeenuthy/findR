import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_finder/models/data.dart';
import 'package:restaurant_finder/screens/view%20restaurant/view_restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ViewRestaurant.routeName, arguments: restaurant);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              CachedNetworkImage(
                imageUrl: restaurant.fullImageUrl,
                errorWidget: (context, _, s) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  );
                  
                },
                placeholder: (context, _) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  );
                },
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Text(
                          restaurant.name.length > 20
                              ? restaurant.name.substring(0, 20) + "..."
                              : restaurant.name,
                          style: Theme.of(context).textTheme.headline6)),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(restaurant.vicinity.length > 25
                          ? restaurant.vicinity.substring(0, 25) + "..."
                          : restaurant.vicinity)
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
