import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {

  final auth= FirebaseAuth.instance;
  CollectionReference ref= FirebaseFirestore.instance.collection('tasks');

  String _email = '';
  String _phoneNo='';
  String _role='';
  String _address='';
  String _profession='';
  String _name='';


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
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                      const SizedBox(height: 10,),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('tasks').orderBy('timestamp', descending: false).where('receiverID', isEqualTo: _email).snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Center(child:  Text('You have no pending tasks!'));
                }
                else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final tasks = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final user = tasks[index];
                    DateTime dateTime = user['timestamp'].toDate();
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Task Detail',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text(user['task']),
                          const SizedBox(height: 5,),
                          const Text('Status',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Row(
                            children: [
                              Text(user['status'],style: const TextStyle(color: Colors.green),),
                              const SizedBox(width: 170,),
                              Container(
                                height: 20,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                ),
                                child:  Center(
                                    child: InkWell(
                                        child: const Text('Update Status',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return  AlertDialog(
                                            title: const Text('Is your task completed?'),
                                            actions: [
                                              
                                              InkWell(
                                                  child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,),),
                                              onTap: (){
                                                    Navigator.of(context).pop();
                                              },
                                              ),

                                              const SizedBox(width: 150,),

                                              InkWell(
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                  child: const Center(child: Text('YES!',style: TextStyle(color: Colors.white),),),
                                                ),
                                                onTap: (){

                                                  ref.doc(snapshot.data!.docs[index]['id'].toString()).update({
                                                    'status':"Completed",
                                                  });

                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                    },
                                    ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),

                          const Text('Assigned At:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text('${DateFormat('yMMMMd').format(dateTime)}'),

                          const SizedBox(height: 5,),

                          const Text('Due Time:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          Text(user['dueTime'].toString()),

                          const SizedBox(height: 5,),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),







        ],
      ),
    );
  }



}
