import 'package:flutter/material.dart';
import 'package:hng_shopper/view/main_screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushAndRemoveUntil(
             
             MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
            (route) => false,

          ),
        ),
        builder: (context, snapshot) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 70,
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.deepPurple,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
