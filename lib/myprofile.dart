import 'package:final_year_project/updateuserpage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String _email = '';
  String _phoneNo='';
  String _role='';
  String _address='';
  String _profession='';
  String _name='';
  String _imageURL='';
  String _age='';






  @override
  void initState() {
    super.initState();
    getCurrentUserData();
;

  }

  Future<void> getCurrentUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      _email = snapshot['email'];
      _phoneNo = snapshot['phoneNo'];
      _role = snapshot['rool'];
      _address = snapshot['address'];
      _profession = snapshot['profession'];
      _name = snapshot['name'];
      _imageURL= snapshot['imageURL'];
      _age= snapshot['age'];

    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

             const SizedBox(height: 20,),

               Container(
                 height: 100,
                 width: 100,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(50),
                   image: DecorationImage(
                     image: NetworkImage(_imageURL),
                   )
                 ),

               ),



            const SizedBox(height: 10,),

             Text('$_name',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),

            SizedBox(height: 20,),

         const Divider(thickness: 3,),

             ListTile(
               leading: Icon(Icons.email),
               title: Text('Email'),
               subtitle: Text('$_email'),

             ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone No'),
              subtitle: Text('$_phoneNo'==''? 'Address Not Updated': '$_phoneNo'),

            ),

            ListTile(
              leading: Icon(Icons.work),
              title: Text('Role'),
              subtitle: Text('$_role'),

            ),

            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('Address'),
              subtitle: Text('$_address'==''? 'Address Not Updated': '$_address'),

            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Age'),
              subtitle:Text('$_age'==''? 'Age Not Updated': '$_age'),

            ),

            ListTile(
              leading: Icon(Icons.work),
              title: Text('Profession'),
              subtitle:Text('$_profession'==''? 'Profession Not Updated': '$_profession'),

            ),

            const SizedBox(height: 10,),
             InkWell(
               child: Container(
                 height: 70,
                 width: 150,
                 decoration: BoxDecoration(
                   color: Colors.deepPurple,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: const Center(
                   child: Text('Update Profile',style: TextStyle(color: Colors.white),),
                 ),
               ),
               onTap: (){
                 Navigator.push(
                     context, MaterialPageRoute(builder: (context) =>  UpdateUserPage()));
               },
             ),






          ],
        ),
      ),
    );
  }



}
