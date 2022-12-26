import 'package:flutter/material.dart';
import 'dart:async';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {

  final emailController = TextEditingController();
  List<String> list = [] ;

  StreamSocket streamSocket = StreamSocket();


  late StreamSubscription<DateTime> streamSubscription;
  //DateTime currentTime = DateTime.now();


  Stream<DateTime> generateNumbers() async*  {

    while(true) {
      await Future<void>.delayed( const Duration(seconds: 1));
      //yield DateTime.now();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Messages'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<DateTime>(
            stream: generateNumbers(),
            builder: (BuildContext context, AsyncSnapshot<DateTime> snapshot,) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('');
              } else if (snapshot.connectionState == ConnectionState.active
                  || snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Text(
                      snapshot.data.toString(),
                      style: const TextStyle(color: Colors.teal, fontSize: 36)
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }

            },
          ),
          StreamBuilder(
            stream: streamSocket.getResponse,
            initialData: [
              'No data'
            ],
            builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: const Text(''));
              }else if(snapshot.hasError){
                return Text('error'+snapshot.error.toString());
              }else if(snapshot.connectionState == ConnectionState.active){
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                        return   Padding(
                          padding: const EdgeInsets.only(left: 390.0),
                          child: Text( snapshot.data![index].toString()),
                        );
                      }
                  ),
                );
              }else {
                return Text('some thing went wrong');
              }
            },
          ),
          Row(
            children: [
              Expanded(child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: '  Enter a Message'
                ),
              )),
              TextButton(onPressed: (){

                list.add(emailController.text.toString());
                streamSocket.addResponse(list);
                emailController.clear();
              }, child: Icon(Icons.send)
              )
            ],
          )

        ],
      ),
    );
  }


}

class StreamSocket {

  final _socketResponse = StreamController<List<String>>.broadcast();

  void Function(List<String>) get addResponse => _socketResponse.sink.add;
  Stream<List<String>> get getResponse => _socketResponse.stream.asBroadcastStream();


}