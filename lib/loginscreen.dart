import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:final_year_project/forgetpwd.dart';
import 'package:final_year_project/signupscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                padding: EdgeInsets.only(right: 280),
                child: Text('LogIn',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Username",
                    labelText: "Username",
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
              Padding(
                padding: const EdgeInsets.only(left: 220),
                child: InkWell(
                  child: const Text('Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: (){
                        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ForgetPwdScreen()));
                      },
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
                    color: const Color(0xFF7C4DFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Center(
                      child: InkWell(
                        child: const Text('LogIn',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                            onTap: (){
                                  Navigator.push(
            context, MaterialPageRoute(builder: (context) => const CommonUserDashboardScreen()));
                            },
                      )
                      
                      ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children:  [
                    const Text('Do not have account?'),
                    InkWell(
                      child: const Text(' SignUp',style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: (){
                         Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
               Padding(
                padding: const EdgeInsets.only(left: 250),
                child: InkWell(
                  child: const Text('Admin Access',style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD500F9))),
                   onTap: (){
                                Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AdminLoginScreen()));
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
