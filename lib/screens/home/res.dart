import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Res extends StatelessWidget {
  const Res({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100,),
          Text("kjd"),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
            ),
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
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 280,
                    child: const Text("Upnormal cafe", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold))),
                  
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 2,),
                    Text("abuja")
                  ],
                )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}