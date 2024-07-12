import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_flutter/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Column(
      children: [
        Center(
          child: LottieBuilder.asset("Lottie/Animation - 1720699236089.json"),
        )
      ],
    ),
      nextScreen: const HomePage(),
    splashIconSize: 400,
    backgroundColor: Color(0xFFEFC2BAFF),);
  }
}
