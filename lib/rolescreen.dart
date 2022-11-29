import 'package:final_year_project/loginscreen.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  List dropDownListData = [
    {"title": "Common User", "value": "1"},
    {"title": "Volunteer Worker", "value": "2"},
    {"title": "Volunteer Doctor", "value": "3"},
  ];

  String selectedRole = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 250,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                contentPadding: const EdgeInsets.only(left: 30, right: 30),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRole,
                  isDense: true,
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    const DropdownMenuItem(
                        child: Text(
                          "Select Your Role",
                        ),
                        value: ""),
                    ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                          child: Text(e['title']), value: e['value']);
                    }).toList(),
                  ],
                  onChanged: (newValue) {
                    setState(
                      () {
                        selectedRole = newValue!;
                        print(selectedRole);
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 200),
              child: Text('We are waiting for you!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFFF2994A))),
            ),
            const SizedBox(
              height: 100,
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
                      child: Text('SignUp',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            child: AlertDialog(
                          title: const Text('Account Created Successfully!'),
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  const Text('Already have account?'),
                  InkWell(
                    child: const Text(' LogIn',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
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
