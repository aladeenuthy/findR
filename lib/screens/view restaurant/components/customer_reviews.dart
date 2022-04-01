import 'package:flutter/material.dart';
import 'package:restaurant_finder/models/data.dart';

class CustomerReviews extends StatelessWidget {
  final Review review;
  const CustomerReviews({Key? key, required this.review}) : super(key: key);

  List<Widget> _buldRatings() {
    List<Widget> ratings = [];
    List rating = review.rating.toString().split(".");
    for (int i = 1; i <= 5; i++) {
      if (i <= int.parse(rating[0])) {
        ratings.add(
          const Icon(Icons.star, color: Colors.amber),
        );
      } else if (int.parse(rating[1]) != 0) {
        ratings.add(
          const Icon(Icons.star_half, color: Colors.amber),
        );
      } else {
        ratings.add(
          const Icon(Icons.star_outline, color: Colors.amber),
        );
      }
    }
    return ratings;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(review.author,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16)),
        const SizedBox(
          height: 3,
        ),
        Text(review.description),
        const SizedBox(
          height: 5,
        ),
        Row(children:  [
          ..._buldRatings()
        ]),
        const SizedBox(
          height: 5,
        ),
        Text(review.relativeTimeDescription),
        const Divider(thickness: 3),
        const SizedBox(
          height: 10,
        ),
      
      ],
    );
  }
}
