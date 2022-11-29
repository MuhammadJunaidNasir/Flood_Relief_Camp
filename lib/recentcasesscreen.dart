import 'package:flutter/material.dart';

class RecentCasesScreen extends StatefulWidget {
  const RecentCasesScreen({super.key});

  @override
  State<RecentCasesScreen> createState() => _RecentCasesScreenState();
}

class _RecentCasesScreenState extends State<RecentCasesScreen> {
  List cities = ['Multan','Muzaffargarh','Rahim Yar Khan','DG Khan','Hyderabad','Bahalwalpur','Burewala','Vehari','Mailsi'];
  List date = ['Jan','Feb','March','April','May','June','July','August','Dec'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Cases'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return  ListTile(
                leading: const Icon(Icons.warning),
                title: Text(cities[index]),
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
    );
  }
}
