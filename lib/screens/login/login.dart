import 'package:flutter/material.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/screens/signup/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  var _authData = {};
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildInputField(
    String hintText,
    IconData icon,
    TextEditingController? controller,
  ) {
    return TextFormField(
        obscureText: hintText.contains('password') ? _obscureText : false,
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
        onSaved: (value) {
          _authData[hintText] = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Base(
      bottomNav: false,
      body: Column(
        children: [
          SizedBox(height: mediaQuery.height * 0.10),
          SizedBox(
            height: mediaQuery.height * 0.85 ,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.05,
                            ),
                            _buildInputField(
                                'username', Icons.person, _usernameController),
                            SizedBox(
                            height: constraints.maxHeight * 0.05,
                          ),
                            _buildInputField(
                                'password',
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                _passwordController),
                            ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                ClipOval(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Login"),
                                    style: ElevatedButton.styleFrom(
                                        primary: color2,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 25)),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(Signup.routeName);
                                },
                                child: const Text("Signup instead? "),
                                style: TextButton.styleFrom(primary: color2),
                              ),
                            )
                          ]
                            );
              }
            ),
          ),
        ],
      )
    );
  }
}
