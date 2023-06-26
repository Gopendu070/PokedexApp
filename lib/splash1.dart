import 'package:flutter/material.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/splash2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here, such as loading data or performing tasks
    // that should be done before showing the main screen.
    // You can use Future.delayed() to simulate a delay.
    Future.delayed(Duration(milliseconds: 1500), () {
      // Navigate to the main screen or any other screen after the splash screen.
      // You can use Navigator.pushReplacement() to prevent going back to the splash screen.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen02()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var widt = MediaQuery.of(context).size.width;
    return Scaffold(
      // Customize the splash screen layout as needed
      body: Stack(children: [
        Center(
            child: Image.asset('lib/asset/image/pokeClose.png', height: 220)),
        Positioned(
            left: widt / 2 - 100,
            bottom: 50,
            child: Image.asset(
              'lib/asset/image/pokedex.png',
              height: 50,
              width: 200,
            ))
      ]),
    );
  }
}
