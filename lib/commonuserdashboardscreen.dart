import 'package:final_year_project/donatemoneyscreen.dart';
import 'package:final_year_project/floodreportingscreen.dart';
import 'package:final_year_project/floodvisualization.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/mytasksscreen.dart';
import 'package:final_year_project/recentcasesscreen.dart';
import 'package:final_year_project/userdonationsscreen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:final_year_project/chatscreen.dart';
import 'package:final_year_project/myprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommonUserDashboardScreen extends StatefulWidget {
  const CommonUserDashboardScreen({super.key});

  @override
  State<CommonUserDashboardScreen> createState() =>
      _CommonUserDashboardScreenState();
}

class _CommonUserDashboardScreenState extends State<CommonUserDashboardScreen> {
  @override

  final auth= FirebaseAuth.instance;

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
      _imageURL=snapshot['imageURL'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Logged in as Common User',style: TextStyle(fontSize: 14),),
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
                currentAccountPicture:  CircleAvatar(
                     backgroundImage: NetworkImage(_imageURL)
                ),
                accountName: Text('$_name',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                accountEmail: Text('$_email',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                decoration: const BoxDecoration(
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
            const Divider(
              thickness: 2,
            ),
            ListTile(
              leading: const Icon(Icons.attach_money, ),
              title: InkWell(
                child: const Text('My Donations'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDonationsScreen()));
                },
              ),

            ),

            ListTile(
              leading: const Icon(Icons.task),
              title: InkWell(
                child: const Text('My Tasks'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTasksScreen()));
                },
              ),
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: InkWell(
                child: const Text('Logout',style: TextStyle(color: Colors.red),),
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
          gradient:  LinearGradient(colors: [Colors.purple,Colors.red,]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 13,
                  top: 50,
                ),
                child: Container(
                    height: 200,
                    width: 360,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Colors.red,Colors.yellow]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 8.0),
                          child: Text('Report Disaster',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.brown)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 5.0),
                          child:
                              Text('Add details of the affected area to help '),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text('the victims!'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0, top: 35),
                          child: InkWell(
                            child: Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text('Click To Report Case',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white)),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                            FloodReportingScreen()));
                            },
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Container(
                  height: 100,
                  width: 360,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Colors.red,Colors.yellow]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Container(
                    height: 70,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Icon(Icons.attach_money, color: Colors.white),
                        InkWell(
                          child: const Text('DONATE NOW',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeScreen()));
                          },
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                child: const Text('Click Here To See Recent Cases',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecentCasesScreen()));
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  height: 100,
                  width: 360,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Colors.red,Colors.yellow]),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          child: Text('Google Map View',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      onTap: (){
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context)=> const FloodVisualizationScreen()));
                      },
                      ),
                      Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
                    ],
                  ),
                ),
              ),


            ]),
            
      ),
    );
  }
}
