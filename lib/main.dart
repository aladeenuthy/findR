import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/places.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_finder/screens/signup/signup.dart';
import 'package:restaurant_finder/screens/view%20restaurant/view_restaurant.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Place(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'findR',
        theme: lightTheme(),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Base();
              } else {
                return const Login();
              }
            }),
        routes: {
          Signup.routeName: (context) => const Signup(),
          ViewRestaurant.routeName: (context) => const ViewRestaurant()
        },
      ),
    );
  }
}
