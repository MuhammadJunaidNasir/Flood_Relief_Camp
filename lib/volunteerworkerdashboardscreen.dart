import 'package:final_year_project/chatscreen.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/mytasksscreen.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/myprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readmore/readmore.dart';

class VolunteerWorkerDashboardScreen extends StatefulWidget {
  const VolunteerWorkerDashboardScreen({super.key});

  @override
  State<VolunteerWorkerDashboardScreen> createState() => _VolunteerWorkerDashboardScreenState();
}

class _VolunteerWorkerDashboardScreenState extends State<VolunteerWorkerDashboardScreen> {

  final auth= FirebaseAuth.instance;
  final fireStore= FirebaseFirestore.instance.collection('cases').snapshots();


  String _email = '';
  String _phoneNo='';
  String _role='';
  String _address='';
  String _profession='';
  String _name='';
  String _imageURL='';



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
      _phoneNo = snapshot['phoneNo'];
      _role = snapshot['rool'];
      _address = snapshot['address'];
      _profession = snapshot['profession'];
      _name = snapshot['name'];
      _imageURL= snapshot['imageURL'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Logged In as Volunteer Worker',style: TextStyle(fontSize: 13),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 10, right: 18),
              child: InkWell(
                child: const Icon(Icons.chat),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const ChatScreen()));
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: CircleAvatar(
                radius: 23.5,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(_imageURL)
                ),
              ),
            ),

          ]),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(children: [
             UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(_imageURL)
                ),
                accountName: Text('$_name',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                accountEmail: Text('$_email',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                decoration: BoxDecoration(
                  color: Colors.purple,
                )),
            InkWell(
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'My Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>  MyProfile()));
              },
            ),

            ListTile(
              leading: const Icon(Icons.task),
              title: InkWell(
                child:  const Text('My Tasks'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTasksScreen()));
                },
              ),
            ),

            const Divider(
              thickness: 2,
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: InkWell(
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  auth.signOut().then((value) =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()))
                  );
                },
              ),
            ),
          ])),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red, Colors.orange]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
            children:  [


              const Padding(
                padding:  EdgeInsets.only(right: 150.0,top: 20,bottom: 10),
                child: Text('Reported Cases',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
              ),

              StreamBuilder<QuerySnapshot>(
                  stream: fireStore,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting)
                      return CircularProgressIndicator();

                    if(snapshot.hasError)
                      return Text('Error');

                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                            return Card(
                              color: Colors.white70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Row(
                                    children: [
                                      Text(' City:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['cityName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),


                                  Row(
                                    children: [
                                      Text(' District:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['districtName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Text(' Province:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['provinceName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Text(' Case Details:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  const SizedBox(height: 5,),


                                   ReadMoreText(
                                     '${snapshot.data!.docs[index]['description']}',
                                    trimLines: 1,
                                    trimCollapsedText: 'read more',
                                    trimExpandedText: 'show less',
                                    lessStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700],
                                    ),
                                     moreStyle: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.green[700],
                                     ),
                                  ),

                                  const SizedBox(height: 10,),

                                  Text(' Location Image:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage('${snapshot.data!.docs[index]['locationImgURL'].toString()}'),
                                          fit: BoxFit.cover
                                      ),

                                    ),
                                  ),

                                  const SizedBox(height: 20,),
                                ],
                              ),
                            );
                          }

                      ),

                    );



                  }),



            ]),
      ),

    );
  }
}
