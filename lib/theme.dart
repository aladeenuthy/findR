import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData lightTheme() {
  return ThemeData(
    
      scaffoldBackgroundColor: scaffoldColor,
      inputDecorationTheme: inputTheme(),
      textTheme: ThemeData.light().textTheme.copyWith(
          headline3: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
          headline4:
              ThemeData.light().textTheme.headline3!.copyWith(fontSize: 29, color: Colors.black, fontWeight: FontWeight.bold),
          headline5: ThemeData.light().textTheme.headline3!.copyWith(
                fontSize: 24, 
              ),
          bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                color: textColor,
                fontSize: 20,
              )),
      colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
        );
}

InputDecorationTheme inputTheme() {
  return const InputDecorationTheme(
      hintStyle: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 19
          )
    );
}
