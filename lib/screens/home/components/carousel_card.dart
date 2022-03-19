import 'package:flutter/material.dart';

class CarousalCard extends StatelessWidget {
  final String imageUrl;
  const CarousalCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageUrl), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20)
    ),
    );
  }
}
