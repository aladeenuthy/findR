import 'package:flutter/material.dart';
class CustomerReviews extends StatelessWidget {
  const CustomerReviews({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text("John doe", style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 16)),
        const SizedBox(height: 3,),
        const Text("A wonderful place to be, very tasty and delicious recipe"),
        const SizedBox(height: 5,),
        Row(children: const [
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber),
          Icon(Icons.star, color: Colors.amber)
        ]),
        const SizedBox(
          height: 5,
        ),
        const Text('3 months ago'),
        const Divider(),
        const SizedBox(height: 10,)
      ],
    );
  }
}