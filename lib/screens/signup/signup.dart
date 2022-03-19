import 'package:flutter/material.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  var _authData = {};
  final _controller = TextEditingController();

  Widget _buildInputField(
    String hintText,
    String? Function(String?) validator,
    IconData icon, {
    TextInputType inputType = TextInputType.text,
    TextEditingController? controller,
  }) {
    return TextFormField(
        validator: validator,
        obscureText: hintText.contains('password') ? _obscureText : false,
        keyboardType: inputType,
        cursorColor: Colors.black,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: hintText.contains('password')
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(icon))
                : Icon(icon),
            hintText: hintText),
        onSaved: hintText.contains('confirm')
            ? null
            : (value) {
                _authData[hintText] = value;
              });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Base(
      bottomNav: false,
      backButton: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: mediaQuery.height * 0.10),
              SizedBox(
              height: (mediaQuery.height * 0.85) + 100,
              child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account ',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  _buildInputField('username', (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Username is too short!';
                    }
                    return null;
                  }, Icons.person),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildInputField('email', (value) {
                    if (value!.isEmpty || value.contains('@')) {
                      return 'Invalid email!';
                    }
                    return null;
                  }, Icons.email, inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildInputField('password', (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                    return null;
                  }, _obscureText ? Icons.visibility_off : Icons.visibility,
                      controller: _controller),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildInputField('confirm password', (value) {
                    if (_controller.text != value) {
                      return "passwords do not match";
                    }
                    return null;
                  }, _obscureText ? Icons.visibility_off : Icons.visibility),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      ClipOval(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Sign up"),
                          style: ElevatedButton.styleFrom(
                              primary: color2,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.19,
                  ),
                  Center(
                    child: TextButton( child: const Text("Login instead?"),onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      primary: color2
                    ),
                    ),
                  )
                ],
              );
              }),
            ),
            ],
          ),
        ));
  }
}
