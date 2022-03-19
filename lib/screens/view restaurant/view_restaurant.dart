import 'package:flutter/material.dart';

class ViewRestaurant extends StatelessWidget {
  const ViewRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(0, mediaQuery.height * 0.10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
              title: Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text("Otonneli" , style: Theme.of(context).textTheme.headline5,),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            height: mediaQuery.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/map.png'),
                    fit: BoxFit.cover)),
          ),
          DraggableScrollableSheet(
            minChildSize:0.1,
            initialChildSize: 0.1,
            maxChildSize: 0.9,
            builder: (context, myscrollController) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: SingleChildScrollView(
                controller: myscrollController,
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: 100,
                        child:  Divider(color: Colors.grey,thickness: 2, )
                        ),
                    )
                  ],
                ),
              ),
            );
          })
        ]),
      ),
    );
  }
}
