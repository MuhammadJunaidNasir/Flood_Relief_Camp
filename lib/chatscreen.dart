import 'dart:ffi';

import 'package:final_year_project/admindashboardscreen.dart';
import 'package:final_year_project/messagesscreen.dart';
import 'package:final_year_project/signupscreen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  var time=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Chats'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red, ]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
                        const SizedBox(height: 20,),
                       Flexible(
                           child: ListView.separated(
                               itemBuilder: (context, index) {
      return  ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/peconst rson.jpg'),
      ),
      title: Text('Ahmed',style: TextStyle(color: Colors.white),
      ),
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const MessagesScreen()));
        },
      subtitle: Text('Hello, I have a query'),
      trailing:  Text('${time.hour}:${time.minute}'),

      );
      },
                               separatorBuilder: (context, index) {
                                 return const Divider(
                                   thickness: 1,
                                   color: Colors.purple,
                                 );
                               },
                               itemCount: 5) ),
          ],
        ),
      ),
    );
  }
}
