import 'package:badges/badges.dart';
import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/chatscreen.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/volunteerdoctortasks.dart';
import 'package:final_year_project/volunteerworkerprofilesetup.dart';
import 'package:final_year_project/volunteerworkertasks.dart';
import 'package:flutter/material.dart';

class VolunteerWorkerDashboardScreen extends StatefulWidget {
  const VolunteerWorkerDashboardScreen({super.key});

  @override
  State<VolunteerWorkerDashboardScreen> createState() => _VolunteerWorkerDashboardScreenState();
}

class _VolunteerWorkerDashboardScreenState extends State<VolunteerWorkerDashboardScreen> {

  List cities = ['Multan','Muzaffargarh','Rahim Yar Khan','DG Khan','Hyderabad','Bahalwalpur','Burewala','Vehari','Mailsi'];
  List date = ['Jan','Feb','March','April','May','June','July','August','Dec'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('You are Logged In as Volunteer Worker',style: TextStyle(fontSize: 13),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 10, right: 18),
              child: InkWell(
                child: Badge(
                  badgeContent: const Text('1'),
                  badgeColor: Colors.white,
                  child: const Icon(Icons.chat),
                ),
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const ChatScreen()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 10, right: 18),
              child: InkWell(
                child: Badge(
                  badgeContent: const Text('1'),
                  badgeColor: Colors.white,
                  child: const Icon(
                    Icons.notifications_active,
                  ),
                ),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                            child: AlertDialog(
                              title: const Text('Admin assigned you a task!'),
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
          ]),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/mypic.jpg'),
                ),
                accountName: Text('Junaid Nasir'),
                accountEmail: Text('mjn7439@gmail.com'),
                decoration: BoxDecoration(
                  color: Colors.purple,
                )),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'My Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
            ),
          ])),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:12.0,top: 15),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Text('Become a Volunteer',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: InkWell(
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white,width: 3),
                        ),
                        child: Center(
                          child: Text('Apply Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,MaterialPageRoute(builder: (context) => const VWProfileSetupScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 30),
            child: Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white,width: 2),
                      ),
                      child: Center(
                        child: Text('View My Tasks',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,MaterialPageRoute(builder: (context) => const VWTasksScreen()));
                    },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 150.0,top: 20,bottom: 10),
            child: Text('Affected Regions',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
          ),

          Flexible(
            child:ListView.separated(
                itemBuilder: (context, index) {
                  return  ListTile(
                    leading: const Icon(Icons.warning),
                    title: Text(cities[index],style: TextStyle(color: Colors.white),),
                    subtitle: Text('A new case has been reported in '+cities[index]+' region. Click to see details...'),
                    trailing:  Text(date[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.purple,
                  );
                },
                itemCount: cities.length),
          ),
        ],
      ),

    );
  }
}
