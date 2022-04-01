import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback restart;
  const ErrorScreen({Key? key, required this.restart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
        SizedBox(height: mediaQuery.height * 0.10),
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/errorImage.png'
            
            )),
            borderRadius: BorderRadius.circular(20)
            )
        ),
        const SizedBox(height: 10,),
        Text(
          'wahala don dey o',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                await Provider.of<Place>(context, listen: false)
                    .fetchNearbyRestos();
                restart();
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: Colors.redAccent,
                ));
              }
            },
            child: const Text("Try again "))
      ]),
    );
  }
}
