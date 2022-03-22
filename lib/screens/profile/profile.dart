import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: mediaQuery.height * 0.10),
        Text(
          FirebaseAuth.instance.currentUser?.displayName as String,
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
            Switch(value: true, onChanged: (value) {}),
            
          ],
        ),
        const SizedBox(height: 30,),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text("Log out"))
      ],
    );
  }
}
