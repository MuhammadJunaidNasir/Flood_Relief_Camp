import 'package:final_year_project/Utilities/utilis.dart';
import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:final_year_project/forgetpwd.dart';
import 'package:final_year_project/notification_services.dart';
import 'package:final_year_project/signupscreen.dart';
import 'package:final_year_project/volunteerdoctordashboardscreen.dart';
import 'package:final_year_project/volunteerworkerdashboardscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


   NotificationServices notificationServices= NotificationServices();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.FirebaseInit();
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      print('Device Token:');
      print(value);
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.deepPurple,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.70,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          height: 40,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          child:  Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          color: Colors.white,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))),

                        Padding(
                          padding: const EdgeInsets.only(right: 250.0),
                          child: InkWell(
                              child: Text('Forgot Password?',style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),),
                              onTap: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> const ForgetPwdScreen()));
                              },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      elevation: 5.0,
                      height: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                      color: Colors.deepPurple,
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 55.0,left: 250),
                      child: InkWell(
                          child: Text('Admin Login',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 18,decoration: TextDecoration.underline),),
                         onTap: (){
                            Navigator.push(context, 
                            MaterialPageRoute(builder: (context)=> AdminLoginScreen()));
                         },
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Common User") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  CommonUserDashboardScreen(),
            ),
          );
        }
        else if (documentSnapshot.get('rool') == "Volunteer Worker") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  VolunteerWorkerDashboardScreen(),
            ),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  VolunteerDoctorDashboardScreen(),
            ),
          );
        }
      } else {
        Utilis().toastMessage('User does not exist');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Utilis().toastMessage('No user found');
        } else if (e.code == 'wrong-password') {
          Utilis().toastMessage('Incorrect Password');
        }
      }
    }
  }
}


