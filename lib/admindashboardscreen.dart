import 'package:badges/badges.dart';
import 'package:final_year_project/adminloginscreen.dart';
import 'package:final_year_project/chatscreen.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {

  List cities = ['Multan','Muzaffargarh','Rahim Yar Khan','DG Khan','Hyderabad','Bahalwalpur','Burewala','Vehari','Mailsi'];
  List date = ['Jan','Feb','March','April','May','June','July','August','Dec'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Admin Panel'),
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
                              title: const Text('Ahmed Completed a task!'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => const AdminDashboardScreen()));
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
              leading: const Icon(Icons.person),
              title: InkWell(
                child: const Text('Common Users'),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: InkWell(
                child: const Text('Volunteer Workers'),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: InkWell(
                child: const Text('Volunteer Doctors'),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.task,),
              title: InkWell(
                child: const Text('Task Management'),
                onTap: () {},
              ),
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
                          builder: (context) => const AdminLoginScreen()));
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
             Padding(
               padding: const EdgeInsets.only(top: 15.0),
               child: Container(
                 height: 250,
                 width: 330,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 8.0,top: 20),
                                   child: Text('Balance ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.purpleAccent),),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 120.0),
                                   child: Container(
                                     height: 80,
                                     width: 80,
                                     child: Image(image: AssetImage('assets/money.jpg')),
                                   ),
                                 ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 30),
                          child: Row(
                            children: [
                              Text('Total Donations:                       ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),),
                              Text('PKR 30,000')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,top: 10),
                          child: Row(
                            children: [
                              Text('This week collection:          ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black54),),
                              Text('PKR 8,000')
                            ],
                          ),
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




        ]),
      ),
    );
  }
}
