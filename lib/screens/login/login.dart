import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_finder/components/base.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/screens/signup/signup.dart';
import 'package:restaurant_finder/utils/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildInputField(
    String hintText,
    IconData icon,
    TextEditingController? controller,
  ) {
    return TextField(
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
    );
  }

  void _login() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    showLoadingSpinner(context);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message!),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Base(
        bottomNav: false,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              height: mediaQuery.height * 0.85,
              child: LayoutBuilder(builder: (context, constraints) {
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
                      _buildInputField('email', Icons.email, _emailController),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
                      ),
                      _buildInputField(
                          'password',
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          _passwordController),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: ElevatedButton(
                              onPressed: _login,
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
                          child: const Text("Signup instead?"),
                          style: TextButton.styleFrom(primary: color2),
                        ),
                      )
                    ]);
              }),
            ),
          ],
        ));
  }
}
