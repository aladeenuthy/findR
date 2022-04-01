import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/models/data.dart';
import 'package:restaurant_finder/providers/places.dart';
import 'package:restaurant_finder/screens/home/components/restaurant.dart';

class SearchRestaurant extends StatefulWidget {
  const SearchRestaurant({Key? key}) : super(key: key);

  @override
  State<SearchRestaurant> createState() => _SearchRestaurantState();
}

class _SearchRestaurantState extends State<SearchRestaurant> {
  Restaurant? searchResult;
  final _controller = TextEditingController();
  bool isLoading = false;
  void _search(String value) async {
    if (_controller.text.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = true;
    });
    try{
      searchResult = await Provider.of<Place>(context, listen: false)
        .searchPlace(_controller.text.trim());
    setState(() {
      isLoading = false;
    });
    if (searchResult == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Place not found"), backgroundColor: Colors.redAccent,));
    }
    }catch(error){
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text(error.toString()), backgroundColor: Colors.redAccent,));
    }
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        style: const TextStyle(color: Colors.black),
        controller: _controller,
        decoration: InputDecoration(
            hintText: "Search place",
            suffixIcon: isLoading
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(
                      color: color2,
                    ),
                  )
                : const Icon(Icons.search)),
        onSubmitted: _search,
      ),
      const SizedBox(
        height: 50,
      ),
      if (searchResult != null)
        RestaurantCard(restaurant: searchResult as Restaurant)
    ]);
  }
}
