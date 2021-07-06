import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        title: Text('udemy'),
        actions: [
          Icon(Icons.sanitizer),
          Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
