import 'package:flutter/material.dart';

class CarousalCard extends StatelessWidget {
  final String imageUrl;
  const CarousalCard({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageUrl), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Spacer(),
      Text("Ottonelli", style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white),),
      const Text("3 miles away" ,style: TextStyle(color: Colors.grey),)
    ],)
    );
  }
}
