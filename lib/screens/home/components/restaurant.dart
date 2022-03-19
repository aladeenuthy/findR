import 'package:flutter/material.dart';
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.19),
                spreadRadius: 5,
                blurRadius: 4,
                offset: const Offset(5, 7))
          ],),
      child: Row(children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/armor1.jpg'),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                child: const Text("Upnormal cafe",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            Row(
              children: [
                const Icon(Icons.location_on),
                SizedBox(
                  width: 2,
                ),
                Text("abuja")
              ],
            )
          ],
        )
      ]),
    );
  }
}