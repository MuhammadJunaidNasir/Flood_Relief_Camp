import 'package:final_year_project/donatemoneyscreen.dart';
import 'package:final_year_project/floodreportingscreen.dart';
import 'package:final_year_project/loginscreen.dart';
import 'package:final_year_project/recentcasesscreen.dart';
import 'package:final_year_project/userdonationsscreen.dart';
import 'package:flutter/material.dart';

class CommonUserDashboardScreen extends StatefulWidget {
  const CommonUserDashboardScreen({super.key});

  @override
  State<CommonUserDashboardScreen> createState() =>
      _CommonUserDashboardScreenState();
}

class _CommonUserDashboardScreenState extends State<CommonUserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('imRelief'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: CircleAvatar(
                radius: 15.5,
                child: CircleAvatar(
                     backgroundImage: AssetImage('assets/mypic.jpg'),
                ),
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
              title: Text('Profile'),
              //trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: InkWell(
                child: const Text('My Donations'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDonationsScreen()));
                },
              ),
              //trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: InkWell(
                child: const Text('Logout'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
              //trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ])),
      body: SingleChildScrollView(
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
                      color: Colors.grey,
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
                                          const FloodReportingScreen()));
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
                    color: Colors.grey,
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
                                        const DonateMoneyScreen()));
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
                        color: Color(0xFFD500F9),
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
            ]),
      ),
    );
  }
}
