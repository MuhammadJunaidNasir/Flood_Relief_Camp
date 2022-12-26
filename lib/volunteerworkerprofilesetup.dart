import 'package:final_year_project/volunteerworkerdashboardscreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class VWProfileSetupScreen extends StatefulWidget {
  const VWProfileSetupScreen({Key? key}) : super(key: key);

  @override
  State<VWProfileSetupScreen> createState() => _VWProfileSetupScreenState();
}

class _VWProfileSetupScreenState extends State<VWProfileSetupScreen> {
  dynamic file;
  void imagePicker() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text('Setting up Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            const SizedBox(
              height: 50,
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
                const Text('Upload Your Picture'),
                const SizedBox(width: 150,),

                if(file!=null)
                  Image.file(
                    file,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Mobile Number",
                  labelText: "Mobile Number",
                  prefixIcon: const Icon(Icons.phone),
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
                  hintText: "Enter Your Address",
                  labelText: "Address",
                  prefixIcon: const Icon(Icons.location_on),
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
                  hintText: "Enter Your Role",
                  labelText: "Role",
                  prefixIcon: const Icon(Icons.task_alt),
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
                  hintText: "Enter Your Profession",
                  labelText: "Profession",
                  prefixIcon: const Icon(Icons.work),
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
                  hintText: "Enter Your Age",
                  labelText: "Age",
                  prefixIcon: const Icon(Icons.face),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
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
                      child: Text('Save',
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            child: AlertDialog(
                              title: const Text('Your data has been saved successfully!'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => const VolunteerWorkerDashboardScreen()));
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
