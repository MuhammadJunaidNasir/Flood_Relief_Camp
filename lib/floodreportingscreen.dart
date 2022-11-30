import 'dart:io';
import 'dart:async';
import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FloodReportingScreen extends StatefulWidget {
  const FloodReportingScreen({super.key});

  @override
  State<FloodReportingScreen> createState() => _FloodReportingScreenState();
}

class _FloodReportingScreenState extends State<FloodReportingScreen> {
  dynamic file;
  void imagePicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        file = File(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Flood Reporting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text('Add Information',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter City",
                  labelText: "City",
                  prefixIcon: const Icon(Icons.location_city),
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
                  hintText: "Enter PostalCode",
                  labelText: "Postal Code",
                  prefixIcon: const Icon(Icons.numbers),
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
                  hintText: "Enter Address",
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                minLines: 2,
                maxLines: 15,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter Description Here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    child: const Icon(Icons.attach_file),
                    onTap: () {
                      imagePicker();
                    },
                  ),
                ),
                const Text('Attach a picture')
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: InkWell(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 249, 0, 116),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text('Upload',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            child: AlertDialog(
                          title: const Text('Case Submitted Successfully!'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CommonUserDashboardScreen()));
                                },
                                child: const Text('OK')),
                          ],
                        ));
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
