import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersListScreen extends StatefulWidget {
  String name,email,phoneNo,imageURL,role,profession,age,address;
   UsersListScreen({Key? key,required this.name,required this.email, required this.phoneNo,required this.imageURL, required this.role, required this.profession, required this.age, required this.address }) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 10,),

               Center(
                 child: CircleAvatar(
                   radius: 50,
                   backgroundImage: NetworkImage(widget.imageURL),
                 ),
               ),
          const SizedBox(height: 5,),

          Center(child: Text('${widget.name}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),

          const Divider(thickness: 3,),

          const SizedBox(height: 50,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.email,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Email:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('${widget.email}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.phone,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Contact:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('  ${widget.phoneNo}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.work,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Role:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('          ${widget.role}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.work,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Profession:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('      ${widget.profession}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.person,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Age:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('                     ${widget.age}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),
          const SizedBox(height: 10,),

          Card(
            color: Colors.blueGrey[300],
            child: Row(
              children: [
                const SizedBox(height: 50,),
                Icon(Icons.location_city,color: Colors.deepPurple,),
                const SizedBox(width: 5,),
                Text('Address:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                const SizedBox(width: 170,),
                Text('             ${widget.address}'),
                const SizedBox(height: 50,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
