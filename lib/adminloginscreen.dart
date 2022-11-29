import 'package:final_year_project/loginscreen.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 220),
                child: Text('Admin LogIn',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Color(0xFFD500F9))),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
             
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD500F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text('LogIn',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
              ),
             
              const SizedBox(
                height: 120,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 250),
                child: InkWell(
                  child: const Text('Other Users Access',style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD500F9))),
                   onTap: (){
                                Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                   },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
