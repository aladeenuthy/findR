import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/screens/home/components/carousel_card.dart';
import 'package:restaurant_finder/screens/home/components/restaurant.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(height: mediaQuery.height * 0.10),
        Text("findR", style: Theme.of(context).textTheme.headline3),
        const SizedBox(
          height: 10,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: mediaQuery.height * 0.55,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: true,
          ),
          items: const [
            CarousalCard(imageUrl: 'assets/images/armor1.jpg'),
            CarousalCard(imageUrl: 'assets/images/jaw1.jpg'),
            CarousalCard(imageUrl: 'assets/images/beast1.jpg'),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Nearby Resto',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        RestaurantCard(),
        SizedBox(
          height: 20,
        ),
        RestaurantCard(),
        SizedBox(
          height: 20,
        ),
        RestaurantCard(),
        SizedBox(
          height: 20,
        ),
        RestaurantCard(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}