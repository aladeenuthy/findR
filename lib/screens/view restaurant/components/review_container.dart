import 'package:flutter/material.dart';

class ReviewContainer extends StatelessWidget {
  final double rating;
  final String distance;
  const ReviewContainer({Key? key, required this.rating, required this.distance}) : super(key: key);

  List<Widget> _buldRatings() {
    List<Widget> ratings = [];
    List ratingList = rating.toString().split("."); // eg 2.5 split 2  5
    for (int i = 1; i <= 5; i++) {
      
      if (i <= int.parse(ratingList[0])) {
        // if i <= 2 add a full star
        ratings.add(
          const Icon(Icons.star, color: Colors.amber),
        );
      } else if (int.parse(ratingList[1]) != 0) {
        // else if 5 != 0 add a  half  star & also mean s loop is done with 2
        ratings.add(
          const Icon(Icons.star_half, color: Colors.amber),
        );
      } else {
        // else add an empty star
        ratings.add(
          const Icon(Icons.star_outline, color: Colors.amber),
        );
      }
    }
    return ratings;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 7,
            ),
            Row(children: [..._buldRatings()]),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text( int.parse(distance) > 1 ? distance + " miles away": distance +  " mile away",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 10,
            ),
            Text(rating.toString())
          ],
        )
      ],
    );
  }
}
