import 'package:badges/badges.dart';
import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/chatscreen.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/volunteerdoctorprofilesetup.dart';
import 'package:final_year_project/volunteerdoctortasks.dart';
import 'package:flutter/material.dart';

class VolunteerDoctorDashboardScreen extends StatefulWidget {
  const VolunteerDoctorDashboardScreen({super.key});

  @override
  State<VolunteerDoctorDashboardScreen> createState() => _VolunteerDoctorDashboardScreenState();
}

class _VolunteerDoctorDashboardScreenState extends State<VolunteerDoctorDashboardScreen> {

  List cities = ['Multan','Muzaffargarh','Rahim Yar Khan','DG Khan','Hyderabad','Bahalwalpur','Burewala','Vehari','Mailsi'];
  List date = ['Jan','Feb','March','April','May','June','July','August','Dec'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('You are Logged In as Volunteer Doctor',style: TextStyle(fontSize: 13),),
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
                  badgeContent: const Text('3'),
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
                                          context,MaterialPageRoute(builder: (context) => const VolunteerDoctorDashboardScreen()));
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
                         padding: const EdgeInsets.only(left: 12.0,top: 30),
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
                                     child: Text('Setup Your Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                   ),
                                 ),
                                 onTap: (){
                                   Navigator.push(
                                       context,MaterialPageRoute(builder: (context) => const VDProfileSetupScreen()));
                                 },
                               ),
                             ],
                           ),
                         ),
                       ),
                      const SizedBox(height: 50,),
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
                          context,MaterialPageRoute(builder: (context) => const VDTasksScreen()));
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
