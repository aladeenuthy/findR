import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/models/data.dart';
import 'package:restaurant_finder/providers/places.dart';
import 'package:restaurant_finder/screens/view%20restaurant/components/customer_reviews.dart';
import 'package:restaurant_finder/screens/view%20restaurant/components/review_container.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/error_screen.dart';

class ViewRestaurant extends StatefulWidget {
  const ViewRestaurant({Key? key}) : super(key: key);
  static const routeName = '/view-resto';

  @override
  State<ViewRestaurant> createState() => _ViewRestaurantState();
}

class _ViewRestaurantState extends State<ViewRestaurant> {
  var hasInit = false;
  late Future _future;
  late Restaurant restaurant;

  //map related
  GoogleMapController? _controller;
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: 'AIzaSyCk8mxRi4Z3zAcuvOhJQlwk4ZjBe98y3wk');
  List<LatLng>? routeCoord;
  final Set<Polyline> polylines = {};
  void getPoints() async {
    routeCoord = await googleMapPolyline.getCoordinatesWithLocation(
        origin: Provider.of<Place>(context, listen: false).userLocation,
        destination: restaurant.location,
        mode: RouteMode.driving);
  }

  @override
  void didChangeDependencies() {
    if (!hasInit) {
      restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
      _future = Provider.of<Place>(context, listen: false)
          .fetchRestoDetails(restaurant.placeId);
      getPoints();
      hasInit = true;
    }
    super.didChangeDependencies();
  }

  void restart() {
    setState(() {
      _future = Provider.of<Place>(context, listen: false)
          .fetchRestoDetails(restaurant.placeId);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

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
            ),
          ),
        ),
        body: FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: color2,
                  ),
                );
              } else if (snapshot.hasError) {
                return ErrorScreen(restart: restart);
              }
              return Stack(children: [
                SizedBox(
                  height: mediaQuery.height,
                  width: double.infinity,
                  child: GoogleMap(
                    polylines: polylines,
                    onMapCreated: (controller) {
                      setState(() {
                        _controller = controller;
                        rootBundle
                            .loadString('assets/grey.json')
                            .then((style) => _controller!.setMapStyle(style));
                        polylines.add(Polyline(
                            polylineId: const PolylineId('route1'),
                            points: routeCoord as List<LatLng>,
                            width: 4,
                            color: color2,
                            visible: true,
                            startCap: Cap.roundCap,
                            endCap: Cap.buttCap));
                      });
                    },
                    markers: {
                      Marker(
                          markerId: const MarkerId('origin'),
                          infoWindow: const InfoWindow(title: "Your Location"),
                          position: Provider.of<Place>(context, listen: false)
                              .userLocation,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure)),
                      Marker(
                          markerId: const MarkerId('destination'),
                          infoWindow: const InfoWindow(title: "destination"),
                          position: restaurant.location,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed))
                    },
                    initialCameraPosition: CameraPosition(
                        zoom: 11.5,
                        target: Provider.of<Place>(context, listen: false)
                            .userLocation),
                  ),
                ),
                DraggableScrollableSheet(
                    minChildSize: 0.1,
                    initialChildSize: 0.1,
                    maxChildSize: 0.9,
                    builder: (context, myscrollController) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                              Text(
                                restaurant.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 220,
                                width: double.infinity,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl: restaurant.fullImageUrl,
                                      fit: BoxFit.cover,
                                      placeholder: (context, _) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: double.infinity,
                                          child: const Center(
                                              child: CircularProgressIndicator(
                                            color: color2,
                                          )),
                                        );
                                      },
                                      errorWidget: (context, _, s) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: double.infinity,
                                        );
                                      },
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
                                child: ListView.builder(
                                    itemCount: snapshot.data!.photoRefs.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        height: double.infinity,
                                        width: 90,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedNetworkImage(
                                              errorWidget: (context, _, s) {
                                                return Container(
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                );
                                              },
                                              placeholder: (context, _) {
                                                return Container(
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                );
                                              },
                                              imageUrl: snapshot
                                                  .data!.photoRefs[index],
                                              fit: BoxFit.cover,
                                            )),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                restaurant.vicinity,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "call: " + snapshot.data!.phoneNumber,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ReviewContainer(
                                  rating: restaurant.rating,
                                  distance: restaurant.distance),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Reviews",
                                  style: Theme.of(context).textTheme.headline6),
                              const SizedBox(
                                height: 15,
                              ),
                              ...snapshot.data!.reviews
                                  .map((review) =>
                                      CustomerReviews(review: review))
                                  .toList()
                            ],
                          ),
                        ),
                      );
                    })
              ]);
            }),
      ),
    );
  }
}
