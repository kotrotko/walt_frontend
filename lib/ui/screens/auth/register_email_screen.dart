import 'package:flutter/material.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({Key? key}) : super(key: key);

  static const routeName = '/register_email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            SizedBox(height: 220),
            Container(
              height: 180,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(50.0),
              color: Colors.grey[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Check your email for a link to complete your signup!", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ],
              )),
          ],
        )
    );
  }
}