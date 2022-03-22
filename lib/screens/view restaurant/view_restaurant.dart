import 'package:flutter/material.dart';
import 'package:restaurant_finder/screens/view%20restaurant/components/customer_reviews.dart';
import 'package:restaurant_finder/screens/view%20restaurant/components/review_container.dart';

class ViewRestaurant extends StatelessWidget {
  const ViewRestaurant({Key? key}) : super(key: key);
  static const routeName = '/view-resto';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(0, mediaQuery.height * 0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  "Otonneli",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            height: mediaQuery.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.cover)),
          ),
          DraggableScrollableSheet(
              minChildSize: 0.1,
              initialChildSize: 0.1,
              maxChildSize: 0.9,
              builder: (context, myscrollController) {
                return Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    controller: myscrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: SizedBox(
                              width: 100,
                              child: Divider(
                                color: Colors.grey,
                                thickness: 2,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/armor1.jpg',
                                fit: BoxFit.cover,
                              )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.19),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: const Offset(0, 5))
                              ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          height: 100,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: double.infinity,
                                  width: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        'assets/images/armor1.jpg',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "About This Resto",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "this is me saying something about this resto to see if it will work i pray it dows",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1?.copyWith(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ReviewContainer(),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Reviews",
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomerReviews(),
                        const CustomerReviews(),
                        const CustomerReviews(),
                        const CustomerReviews(),
                        const CustomerReviews(),
                        const CustomerReviews(),
                      ],
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
