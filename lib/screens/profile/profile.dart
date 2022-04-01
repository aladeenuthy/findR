import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          FirebaseAuth.instance.currentUser?.displayName as String,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 0,
        ),
        ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: const Text("Log out"))
      ],
    );
  }
}
