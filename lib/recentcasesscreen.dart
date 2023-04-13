import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readmore/readmore.dart';

class RecentCasesScreen extends StatefulWidget {
  const RecentCasesScreen({super.key});

  @override
  State<RecentCasesScreen> createState() => _RecentCasesScreenState();
}

class _RecentCasesScreenState extends State<RecentCasesScreen> {
  final auth= FirebaseAuth.instance;
  final fireStore= FirebaseFirestore.instance.collection('cases').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Cases'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.red, Colors.orange]),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
            children:  [


              const Padding(
                padding:  EdgeInsets.only(right: 150.0,top: 20,bottom: 10),
                child: Text('Reported Cases',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
              ),

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
                              color: Colors.white70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Row(
                                    children: [
                                      Text(' City:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['cityName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),


                                  Row(
                                    children: [
                                      Text(' District:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['districtName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Text(' Province:   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                      Text(snapshot.data!.docs[index]['provinceName'].toString(),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),

                                  Text(' Case Details:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  ReadMoreText(
                                    '${snapshot.data!.docs[index]['description']}',
                                    trimLines: 1,
                                    trimCollapsedText: 'read more',
                                    trimExpandedText: 'show less',
                                    lessStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700],
                                    ),
                                    moreStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),

                                  Text(' Location Image:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  const SizedBox(height: 5,),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage('${snapshot.data!.docs[index]['locationImgURL'].toString()}'),
                                          fit: BoxFit.cover
                                      ),

                                    ),
                                  ),

                                  const SizedBox(height: 20,),
                                ],
                              ),
                            );
                          }

                      ),

                    );



                  }),



            ]),
      ),
    );
  }
}
