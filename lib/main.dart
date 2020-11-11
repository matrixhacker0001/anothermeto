import 'package:flutter/material.dart';
import 'package:metoweapp/home/home.dart';
import 'package:metoweapp/login/login.dart';
import 'package:metoweapp/login/register.dart';
import 'package:metoweapp/login/register2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MetoWeApp',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}
