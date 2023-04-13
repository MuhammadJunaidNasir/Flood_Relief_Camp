import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AssignedTasksScreen extends StatefulWidget {
  const AssignedTasksScreen({Key? key}) : super(key: key);

  @override
  State<AssignedTasksScreen> createState() => _AssignedTasksScreenState();
}

class _AssignedTasksScreenState extends State<AssignedTasksScreen> {

  final auth= FirebaseAuth.instance;
  final fireStore= FirebaseFirestore.instance.collection('tasks').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Tasks'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
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
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const SizedBox(height: 10,),

                                Row(
                                  children: [
                                    const Text('Volunteer Name: ',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    Text(snapshot.data!.docs[index]['receiverName'].toString()),
                                  ],
                                ),
                             const SizedBox(height: 10,),

                             const Text('Task Detail: ',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                             const SizedBox(height: 5),
                             Padding(
                               padding: const EdgeInsets.only(left: 80.0),
                               child: Text(snapshot.data!.docs[index]['task'].toString(),style: TextStyle(color: Colors.black),),
                             ),

                             const SizedBox(height: 10),
                             Row(
                               children: [
                                 const Text('Due Time: ',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                 Text(snapshot.data!.docs[index]['dueTime'].toString(),style: TextStyle(color: Colors.black),),
                               ],
                             ),
                             const SizedBox(height: 10,),
                             Row(
                               children: [
                                 const Text('Status: ',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                 Text(snapshot.data!.docs[index]['status'].toString(),style: TextStyle(color: Colors.black),),
                               ],
                             ),
                             const SizedBox(height: 10,),



                           ],
                         ),
                       );

                      }

                  ),

                );



              }),
        ],
      ),
    );
  }
}
