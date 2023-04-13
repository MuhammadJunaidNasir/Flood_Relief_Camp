import 'package:final_year_project/Utilities/utilis.dart';
import 'package:final_year_project/admindashboardscreen.dart';
import 'package:final_year_project/taskmanagementscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';


class AssignTaskScreen extends StatefulWidget {
  String email,name;
   AssignTaskScreen({Key? key, required this.email, required this.name}) : super(key: key);

  @override
  State<AssignTaskScreen> createState() => _AssignTaskScreenState();
}

class _AssignTaskScreenState extends State<AssignTaskScreen> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference casesRef = FirebaseFirestore.instance.collection('tasks');

  String task='';

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Assign Task To ${widget.name}'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 12.0,right: 12),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: '                             Write Task',
                  //prefixIcon: Icon(Icons.task),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                   )
              ),
              onChanged: (value) {
                setState(() {
                  task = value;
                });
              },
            ),
          ),

          const SizedBox(height: 50,),


          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Due Date'),
          ),

          const SizedBox(height: 20.0),



          Row(
            children: [

              const Text('  Due Time:   ', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.deepPurple),),

              Text('${DateFormat('yMMMMd').format(selectedDate)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.red),
              ),
            ],
          ),

          const SizedBox(height: 80,),

          InkWell(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text('Assign',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),
            onTap: (){

              if(task.isEmpty){
                Utilis().toastMessage('Please Enter Task First');
              }
              else{
                assignTask(task,widget.email.toString(),selectedDate.toString(),widget.name.toString());
                Utilis().toastMessage('Task Assigned Successfully!');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminDashboardScreen()));
              }
            },
          ),

        ],
      ),
    );
  }

  assignTask(String task,String receiverID,String dueTime,String receiverName) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    String id= DateTime.now().microsecondsSinceEpoch.toString();
    CollectionReference ref = FirebaseFirestore.instance.collection('tasks');
    ref.doc(id).set({
      'task': task,
      'receiverID': receiverID,
      'receiverName': receiverName,
      'dueTime': dueTime,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'Pending',
      'id':id,
    });

  }

}
