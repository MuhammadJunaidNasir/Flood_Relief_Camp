import 'package:final_year_project/Utilities/utilis.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';


class ChatScreen extends StatefulWidget {

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final messageController= TextEditingController();

  String _email = '';
  String _name='';
  String _imageURL='';

  ScrollController _scrollController = ScrollController();



  @override
  void initState() {
    super.initState();
    getCurrentUserData();

    setState(() {
      _scrollController= ScrollController(
        initialScrollOffset: 1000.0,
        keepScrollOffset: true,
      );

    });


  }



  Future<void> getCurrentUserData() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      _email = snapshot['email'];
      _name = snapshot['name'];
      _imageURL=snapshot['imageURL'];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Group Messages'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [



            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('messages').orderBy('timestamp', descending: false).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  final messages = snapshot.data!.docs;


                  return ListView.builder(
                    itemCount: messages.length,
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      final user = messages[index];
                      DateTime dateTime = user['timestamp'].toDate();
                       if(user['senderUserId']==_email){
                         return Padding(
                           padding: const EdgeInsets.only(left: 200.0,right: 10),
                           child: Column(
                             children: [
                               Card(
                                 color: Colors.tealAccent[700],
                                 elevation: 8.5,
                                 child: Row(
                                   children: [
                                     Expanded(child: Text(user['message'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),
                                     //Text(dateTime.hour.toString()+" : "+dateTime.minute.toString()+" "),
                                     Text('${DateFormat('jm').format(dateTime)}'),
                                   ],
                                 ),
                               ),
                             ],
                           ),

                         );
                       }
                       else{
                         return ListTile(
                           leading:  CircleAvatar(
                             backgroundImage: NetworkImage(user['senderImageURL']),
                           ),
                           title: Text(user['senderUserName'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                           subtitle: Text(user['message'].toString(),style: TextStyle(fontSize: 15),),
                           trailing: Text('${DateFormat('jm').format(dateTime)}'),
                         );
                       }
                    },
                  );
                },
              ),
            ),


            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                ),

                InkWell(
                  child: const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.send,color: Colors.white,),
                  ),
                  onTap: (){
                     if(messageController.text.isEmpty){
                        Utilis().toastMessage('Write Message First');
                     }
                     else{
                       sendMessage(_email.toString(), messageController.text, _name.toString());
                       _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(microseconds: 500), curve: Curves.easeOut);
                       messageController.clear();
                     }

                  },
                ),
              ],
            ),









          ],
        ),
      ),
    );
  }


  void sendMessage(String senderUserId, String message, String senderUserName) async {
    // get reference to Firestore collection for messages
    CollectionReference messagesCollection =
    FirebaseFirestore.instance.collection('messages');

    // create new message document with recipient user ID and message text
    DocumentReference newMessageDocRef = messagesCollection.doc();
    await newMessageDocRef.set({
      'senderUserId': senderUserId,
      'senderUserName': senderUserName,
      'senderImageURL': _imageURL,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) =>
        messageController.clear(),
    );

    // add new message document ID to recipient user's list of message IDs
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
    DocumentReference recipientUserDocRef =
    usersCollection.doc(senderUserId);
    await recipientUserDocRef.update({
      'messageIds': FieldValue.arrayUnion([newMessageDocRef.id])});
  }

}
