import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_finder/components/error_screen.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/screens/home/components/carousel_card.dart';
import 'package:restaurant_finder/screens/home/components/restaurant.dart';
import 'package:restaurant_finder/providers/places.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future _future;

  void restart() {
    setState(() {
      _future = Provider.of<Place>(context, listen: false).fetchNearbyRestos();
    });
  }

  @override
  void initState() {
    super.initState();
    _future = Provider.of<Place>(context, listen: false).fetchNearbyRestos();
  }

  @override
  Widget build(BuildContext context) {
    final placeObj = Provider.of<Place>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: color2),
            );
          } else if (snapshot.hasError) {
            return ErrorScreen(restart: restart);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                items: [
                  ...placeObj.nearbyResto.restaurants
                      .sublist(0, 5)
                      .map((res) => CarousalCard(
                            restaurant: res,
                          ))
                      .toList()
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Nearby Resto',
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(
                height: 10,
              ),
              ...placeObj.nearbyResto.restaurants
                  .sublist(5)
                  .map((res) => RestaurantCard(
                        restaurant: res,
                      ))
                  .toList(),
                  const SizedBox(height: 40)
            ],

          );
        });
  }
}
