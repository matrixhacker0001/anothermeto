import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You are on Home Page'),
            Text('Work In Progress'),
          ],
        ),
      ),
    );
  }
}
