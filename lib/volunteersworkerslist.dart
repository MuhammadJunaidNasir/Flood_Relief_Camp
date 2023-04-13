import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/chatscreen.dart';
import 'package:final_year_project/userslistscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteerily Working Users List'),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return ListTile(
                leading: const Icon(Icons.person,color: Colors.deepPurple,),
                title: Text(user['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(user['email']),
                trailing: Text(user['rool']),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> UsersListScreen(
                          name: '${user['name']}',email:'${user['email']}',phoneNo:'${user['phoneNo']}',imageURL:'${user['imageURL']}',
                          role:'${user['rool']}',profession:'${user['profession']}',age:'${user['age']}',address:'${user['address']}')));
                },
              );
            },
          );
        },
      ),
    );
  }
}
