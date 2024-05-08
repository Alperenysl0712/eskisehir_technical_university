import 'dart:async';

import 'package:eskisehir_technical_university/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds and then navigate to HomePage
    Timer(
      const Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA72631),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: MediaQuery.of(context).size.width * 0.45),
              duration: const Duration(seconds: 3),
              builder: (BuildContext context, double width, Widget? child) {
                return Image(
                  image: const AssetImage('lib/images/estu_logo_white.png'),
                  width: width,
                );
              },
            ),
            const SizedBox(height: 40.0),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: MediaQuery.of(context).size.width * 0.85),
              duration: const Duration(seconds: 3),
              builder: (BuildContext context, double width, Widget? child) {
                return Image(
                  image: const AssetImage('lib/images/estu_logo_name_white.png'),
                  width: width,
                );
              },
            ),
          ],
        )
      ),
    );
  }
}