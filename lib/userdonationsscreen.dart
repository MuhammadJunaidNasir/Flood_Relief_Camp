import 'package:flutter/material.dart';

class UserDonationsScreen extends StatefulWidget {
  const UserDonationsScreen({super.key});

  @override
  State<UserDonationsScreen> createState() => _UserDonationsScreenState();
}

class _UserDonationsScreenState extends State<UserDonationsScreen> {
  List items = ['Food', 'Clothes', 'Blanket', 'Money', 'Tents','Blood','Water Bottles'];
  List totalitems = ['10 items', '8 items', '15 items', '20 items', '31 items','15 items','50 items'];
  List date = ['30 June', '8 July', '15 Aug', '20 Sept', '30 Nov','1 Dec','15 Dec'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Donations'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index],
                    style: const TextStyle(
                        color: Colors.green, fontSize: 23)),
                subtitle: Text(totalitems[index],
                    style: const TextStyle(color: Colors.black)),
                trailing: Text(date[index],
                    style: const TextStyle(color: Colors.black)),
                    
              );
              
            }),
      ),
    );
  }
}
