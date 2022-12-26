import 'package:flutter/material.dart';
class VWTasksScreen extends StatefulWidget {
  const VWTasksScreen({Key? key}) : super(key: key);

  @override
  State<VWTasksScreen> createState() => _VWTasksScreenState();
}

class _VWTasksScreenState extends State<VWTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks VW'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
