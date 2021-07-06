// @dart=2.9

import 'package:flutter/material.dart';
import 'package:udemy_mansur/useres_screen.dart';
import 'bmi_screen.dart';
import 'home_screen.dart';
import 'layouts/home_layout.dart';
import 'login_screen.dart';
import 'messenger_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }

}