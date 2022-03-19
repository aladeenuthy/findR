import 'package:flutter/material.dart';
import 'package:restaurant_finder/constants.dart';
class SearchRestaurant extends StatefulWidget {
  const SearchRestaurant({ Key? key }) : super(key: key);

  @override
  State<SearchRestaurant> createState() => _SearchRestaurantState();
}

class _SearchRestaurantState extends State<SearchRestaurant> {
  Map<String, String>? searchResult;
  final _controller = TextEditingController();
  bool isLoading = false;
  void _search(String value) async {
    
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(children:[
      SizedBox(height: mediaQuery.height * 0.10),
      TextField(
        style: const TextStyle(color: Colors.black),
        controller: _controller,
        decoration: InputDecoration(
            hintText: "Search city",
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
    ]);
  }
}