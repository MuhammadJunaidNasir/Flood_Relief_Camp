import 'package:final_year_project/signupscreen.dart';
import 'package:final_year_project/updatepwdscreen.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Text('Enter Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "123456",
                    labelText: "Verification Code",
                    prefixIcon: const Icon(Icons.numbers),
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
                        child: Text('VERIFY',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              child: AlertDialog(
                            title: const Text('Verification Successful!'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const UpdatePwdScreen()));
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
                    const Text('Do not have an account?'),
                    InkWell(
                      child: const Text(' SignUp',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onTap: () {
                                    Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const SignupScreen()));
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