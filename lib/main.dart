import 'package:flutter/material.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/screens/home/home.dart';
import 'package:restaurant_finder/screens/home/res.dart';
import 'package:restaurant_finder/screens/login/login.dart';
import 'package:restaurant_finder/screens/profile/profile.dart';
import 'package:restaurant_finder/screens/signup/signup.dart';
import 'package:restaurant_finder/screens/view%20restaurant/view_restaurant.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'findR',
    theme: lightTheme(),
      home:  const ViewRestaurant(),
      routes: {
        Signup.routeName:(context) => const Signup()
      },
    );
  }
}

