import 'package:final_year_project/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey='pk_test_51Mn562FT4JdnQJIkoT2q91T7npTKx78byYr7V0em8mc5C0MMH2M03RrzHzxiKiS82Zb8SOxC9WIBEHoCoM69slmw00KkJF20sV';
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
