import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: mediaQuery.height * 0.10),
        const CircleAvatar(
          radius: 68,
          backgroundImage: AssetImage('assets/images/armor1.jpg'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Aladeen",
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Switch to dark mode',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            Switch(value: true, onChanged: (value) {})
          ],
        )
      ],
    );
  }
}
