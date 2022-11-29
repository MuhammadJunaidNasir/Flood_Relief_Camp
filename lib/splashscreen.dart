import 'package:final_year_project/loginscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 
 void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });

    super.initState();
  }
   
  Widget build(BuildContext context) {
    return const Scaffold(
         body: Center(
          child: Image(
            image: AssetImage('assets/splashscreen.PNG'),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            ),
        ),
      );
    
  }
}
