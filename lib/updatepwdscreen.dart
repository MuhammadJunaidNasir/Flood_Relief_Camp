import 'package:final_year_project/loginscreen.dart';
import 'package:flutter/material.dart';
class UpdatePwdScreen extends StatefulWidget {
  const UpdatePwdScreen({super.key});

  @override
  State<UpdatePwdScreen> createState() => _UpdatePwdScreenState();
}

class _UpdatePwdScreenState extends State<UpdatePwdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const SizedBox(
                height: 150,
              ),
      
              const Padding(
                padding: EdgeInsets.only(right: 150),
                child: Text('Update Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              
              const SizedBox(
                height: 50,
              ),
      
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "123456789",
                    labelText: "New Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
      
              const SizedBox(
                height: 10,
              ),
      
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "123456789",
                    labelText: "Re-enter Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
      
               const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C4DFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text('UPDATE',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              child: AlertDialog(
                            title: const Text('Your Password has been updated!'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const LoginScreen()));
                                  },
                                  child: const Text('OK')),
                            ],
                          ));
                        });
                  },
                ),
              ),
      
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    const Text('Login To Your Account. '),
                    InkWell(
                      child: const Text(' LogIn',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                                    Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const LoginScreen()));
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