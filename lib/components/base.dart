import 'package:flutter/material.dart';
import 'package:restaurant_finder/constants.dart';
import 'package:restaurant_finder/screens/home/home.dart';
import 'package:restaurant_finder/screens/profile/profile.dart';
import 'package:restaurant_finder/screens/search/search_restaurant.dart';


class Base extends StatefulWidget {
  final Widget? body;
  final bool backButton;
  final bool bottomNav;
  static const routeName = '/base';
  const Base(
      {Key? key,
      this.body,
      this.backButton = false,
      this.bottomNav = true,
      })
      : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  var _currentIndex = 0;
  final List<Widget> _screens = const [Home(), SearchRestaurant(), Profile()];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        appBar: widget.backButton
            ? PreferredSize(
                preferredSize: Size(0, mediaQuery.height * 0.10),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              )
            : null,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              height: mediaQuery.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover)),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    SizedBox(height: mediaQuery.height * 0.10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                              width: double.infinity,
                              child: widget.body ?? _screens[_currentIndex]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        extendBody: true,
        
        bottomNavigationBar: widget.bottomNav
            ? BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: scaffoldColor,
                elevation: 0,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
                  ])
            : null,
      ),
    );
  }
}
