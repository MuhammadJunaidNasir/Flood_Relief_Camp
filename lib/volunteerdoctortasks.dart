import 'package:flutter/material.dart';
class VDTasksScreen extends StatefulWidget {
  const VDTasksScreen({Key? key}) : super(key: key);

  @override
  State<VDTasksScreen> createState() => _VDTasksScreenState();
}

class _VDTasksScreenState extends State<VDTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks VD'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
