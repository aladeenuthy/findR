import 'package:flutter/material.dart';
import 'package:restaurant_finder/screens/view%20restaurant/view_restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ViewRestaurant.routeName);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/armor1.jpg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      child: Text("Upnormal cafe",
                          style: Theme.of(context).textTheme.headline6)),
                  Row(
                    children: const [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 2,
                      ),
                      Text("abuja")
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
