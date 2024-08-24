import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:books_app/view/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue, // Start color
            Colors.greenAccent, // End color
          ],
          begin: Alignment.topLeft, // Gradient start position
          end: Alignment.bottomRight, // Gradient end position
        ),
      ),
      child: AnimatedSplashScreen(
        duration: 2000,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),gradient: const LinearGradient(
          colors: [
            Colors.blue, // Start color
            Colors.greenAccent, 
            Color.fromARGB(255, 6, 83, 87)// End color
          ],
          begin: Alignment.topLeft, // Gradient start position
          end: Alignment.bottomRight, // Gradient end position
        ),),
              child: const Text(
                "Books Store",textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24, // Adjust font size to your preference
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 400, // Increase width
                height: 400, // Increase height
                child: Lottie.asset(
                  "assets/lottie/readbook.json",
                  fit: BoxFit.cover, // Scales down if too large, otherwise fits
                ),
              ),
            ),
          ],
        ),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.transparent, // Set to transparent since we have a gradient background
      ),
    );
  }
}
