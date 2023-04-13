import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/volunteerdoctordashboardscreen.dart';
import 'package:final_year_project/volunteerworkerdashboardscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'admindashboardscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  final auth= FirebaseAuth.instance;
  String _role='';


 
 void initState() {

   getCurrentUserData();

    Timer(const Duration(seconds: 3), () {
      if(auth.currentUser==null ){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
     }
     else if(auth.currentUser!=null && _role=='admin'){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminDashboardScreen()));
     }
     else if(auth.currentUser!=null && _role=='Common User'){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const CommonUserDashboardScreen()));
     }
     else if(auth.currentUser!=null && _role=='Volunteer Worker'){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const VolunteerWorkerDashboardScreen()));
     }
     else if(auth.currentUser!=null && _role=='Volunteer Doctor'){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const VolunteerDoctorDashboardScreen()));
     }
    });



    super.initState();
  }

  Future<void> getCurrentUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      _role = snapshot['rool'];
    });
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
