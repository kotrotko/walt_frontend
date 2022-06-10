import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  static const routeName = '/input_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('Success')), body: Text("Your realty added successfully"));
  }
}