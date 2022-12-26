import 'package:final_year_project/Utilities/utilis.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ForgetPwdScreen extends StatefulWidget {
  const ForgetPwdScreen({super.key});

  @override
  State<ForgetPwdScreen> createState() => _ForgetPwdScreenState();
}

class _ForgetPwdScreenState extends State<ForgetPwdScreen> {

  final _formkey= GlobalKey<FormState>();
  final emailController= TextEditingController();
    FirebaseAuth _auth= FirebaseAuth.instance;
    bool loading=false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                        const SizedBox(
                height: 200,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 200),
                child: Text('Reset Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              const SizedBox(
                height: 50,
              ),
              
               Form(
                   key: _formkey,
                   child: Padding(
                     padding: const EdgeInsets.all(20),
                     child: TextFormField(
                       controller: emailController,
                       keyboardType: TextInputType.emailAddress,
                       decoration: InputDecoration(
                         hintText: "Enter Your Email",
                         labelText: "Email",
                         prefixIcon: const Icon(Icons.email),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                       validator: (value){
                         if(value!.isEmpty){
                           return 'Enter Email';
                         }
                       },
                     ),
                   ),
               ),
      
               const SizedBox(
                height: 80,
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
                      child:  InkWell(
                          child: loading==true? CircularProgressIndicator(): const Text('Reset Password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              loading=true;
                            });
                            _auth.sendPasswordResetEmail(
                                email: emailController.text.toString()).then((value){
                              Utilis().toastMessage('An Email has been sent to you to revover your password. Please check your email');
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              setState(() {
                                loading=false;
                              });
                            }).onError((error, stackTrace){
                              Utilis().toastMessage(error.toString());
                              setState(() {
                                loading=false;
                              });
                            });

                          }
                        },
                      ),
                  ),
                ),
              ),
      
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    const Text('Do not have an account?'),
                    InkWell(
                      child: const Text(' SignUp',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                        Navigator.push(
                          context,MaterialPageRoute(builder: (context) =>  const SignupScreen()));
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );

  }
}