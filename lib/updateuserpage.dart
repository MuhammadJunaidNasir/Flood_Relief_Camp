import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/Utilities/utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  String email = '';
  String phoneNo = '';
  String role = '';
  String name = '';
  String address = '';
  String profession = '';
  String age='';

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;






  bool loading=false;


  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;

  File? _image;
  final picker= ImagePicker();

  Future getImage()async{
    final pickedFile= await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
    setState(() {
      if(pickedFile!=null){
        _image=File(pickedFile.path);
      }

    });
  }

  String _email = '';

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  Future<void> getCurrentUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      _email = snapshot['email'];
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              InkWell(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    //color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: _image!=null? Image.file(_image!.absolute) : const Center(child: Text('Select Image'),),
                ),
                onTap: (){
                  getImage();
                },
              ),


             const SizedBox(height: 10,),

              InkWell(
                  child: loading==true? CircularProgressIndicator(color: Colors.deepPurple,): Text('Upload Image',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                onTap: ()async{

                                        setState(() {
                                          loading=true;
                                        });

                                        uploadImage().then((value){
                                          setState(() {
                                            loading=false;
                                          });
                                          Utilis().toastMessage('Profile Photo uploaded successfully');
                                        }

                                        );
                },
              ),



              const SizedBox(height: 10,),
              const Divider(),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if(name.isEmpty){
                    Utilis().toastMessage('Enter Name First');
                  }
                  else{
                    updateName().then((value) =>
                        Utilis().toastMessage('Name updated Successfully!'),
                    );
                  }
                },
                child: Text('Update Name'),
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(email.isEmpty){
                    Utilis().toastMessage('Enter Email First');
                  }
                  else{
                    updateEmail().then((value) =>
                        Utilis().toastMessage('Email updated Successfully!'),
                    );
                  }
                },
                child: Text('Update Email'),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  setState(() {
                    phoneNo = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(phoneNo.isEmpty){
                    Utilis().toastMessage('Enter Phone Number First');
                  }
                  else{
                    updatePhoneNumber().then((value) =>
                        Utilis().toastMessage('Phone Number updated Successfully!'),
                    );
                  }
                },
                child: Text('Update Phone Number'),
              ),


              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(address.isEmpty){
                    Utilis().toastMessage('Enter Address First');
                  }
                  else{
                    updateAddress().then((value) =>
                        Utilis().toastMessage('Address updated Successfully!'),
                    );
                  }
                },
                child: Text('Update Address'),
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(age.isEmpty){
                    Utilis().toastMessage('Enter Age First');
                  }
                  else{
                    updateAge().then((value) =>
                        Utilis().toastMessage('Age updated Successfully!'),
                    );
                  }
                },
                child: Text('Update Age'),
              ),




              TextField(
                decoration: InputDecoration(
                  labelText: 'Profession',
                ),
                onChanged: (value) {
                  setState(() {
                    profession = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if(profession.isEmpty){
                    Utilis().toastMessage('Enter Profession First');
                  }
                  else{
                    updateProfession().then((value) =>
                        Utilis().toastMessage('Profession updated Successfully!'),
                    );
                  }
                },
                child: const Text('Update Profession'),
              ),

              const SizedBox(height: 16.0),


            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateName() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'name': name,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }
  Future<void> updateEmail() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'email': email,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }
  Future<void> updatePhoneNumber() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'phoneNo': phoneNo,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }

  Future<void> updateAddress() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'address': address,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }

  Future<void> updateAge() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'age': age,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }

  Future<void> updateProfession() async {
    final user = _auth.currentUser;
    if (user != null) {
      final userRef = _firestore.collection('users').doc(user.uid);
      await userRef.update({
        'profession': profession,
      });
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User Profile updated successfully.'),
        ),
      );
    }
  }


Future uploadImage()async{

  firebase_storage.Reference ref= firebase_storage.FirebaseStorage.instance.ref('${_email}');
  firebase_storage.UploadTask uploadTask= ref.putFile(_image!.absolute);

  await Future.value(uploadTask);
  var newURL= await ref.getDownloadURL();

  final user = _auth.currentUser;
  if (user != null) {
    final userRef = _firestore.collection('users').doc(user.uid);
    await userRef.update({
      'imageURL': newURL,
    });

  }

}



}
