import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/Utilities/utilis.dart';
import 'package:final_year_project/commonuserdashboardscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FloodReportingScreen extends StatefulWidget {
  @override
  _FloodReportingScreenState createState() => _FloodReportingScreenState();
}

class _FloodReportingScreenState extends State<FloodReportingScreen> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference casesRef = FirebaseFirestore.instance.collection('cases');

  String cityName = '';
  String districtName = '';
  String provinceName = '';
  String description = '';
  String locationImgURL='';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Case Here'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter City Name',
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
                onChanged: (value) {
                  setState(() {
                    cityName = value;
                  });
                },
              ),

              const SizedBox(height: 10,),

              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter District Name',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onChanged: (value) {
                  setState(() {
                    districtName = value;
                  });
                },
              ),
              const SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter Province Name',
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onChanged: (value) {
                  setState(() {
                    provinceName = value;
                  });
                },
              ),
              const SizedBox(height: 15,),
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                    labelText: '                 Write Description Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                ),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),

              const SizedBox(height: 10.0),

              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  //color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: _image!=null? Image.file(_image!.absolute) : const Center(child: Text('No Image Selected'),),
              ),

              const SizedBox(height: 5.0),

              InkWell(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text('Select Image',style: TextStyle(color: Colors.white),),
                  ),
                ),
                onTap: (){
                  getImage();
                },
              ),

              const SizedBox(height: 10.0),

              ElevatedButton(
                onPressed: () {

                  if(cityName.isEmpty){
                    Utilis().toastMessage('Add all Details First');
                  }
                  else if(districtName.isEmpty){
                    Utilis().toastMessage('Add all Details First');
                  }
                  else if(provinceName.isEmpty){
                    Utilis().toastMessage('Add all Details First');
                  }
                  else if(description.isEmpty){
                    Utilis().toastMessage('Add all Details First');
                  }
                  else if(cityName.isEmpty && districtName.isEmpty && provinceName.isEmpty && description.isEmpty ){
                    Utilis().toastMessage('Add all Details First');
                  }
                  else{
                    uploadImage();
                    Utilis().toastMessage('Case has been reported Successfully!');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const CommonUserDashboardScreen()));
                  }


               },
                child: const Text('Report Case',style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }



  /* addNewCase(String cityName, String districtName,String provinceName, String description,String imgURL) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference ref = FirebaseFirestore.instance.collection('cases');
    ref.doc().set({
      'cityName': cityName,
      'districtName': districtName,
      'provinceName': provinceName,
      'description': description,
      //'locationImgURL': imgURL ,
    });

  }
  */



  Future uploadImage()async{

    DateTime dateTime= DateTime.now();

    firebase_storage.Reference ref= firebase_storage.FirebaseStorage.instance.ref('${dateTime}');
    firebase_storage.UploadTask uploadTask= ref.putFile(_image!.absolute);

    await Future.value(uploadTask);
    var newURL= await ref.getDownloadURL();


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference _ref = FirebaseFirestore.instance.collection('cases');
    _ref.doc().set({
      'cityName': cityName,
      'districtName': districtName,
      'provinceName': provinceName,
      'description': description,
      'locationImgURL': newURL ,
    });

  }

}
