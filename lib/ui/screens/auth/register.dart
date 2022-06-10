import 'package:flutter/material.dart';
import 'package:gunio/ui/widgets/auth/register/form.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/auth/register';

  @override
  Widget build(BuildContext context) {

    var title;

    return new Scaffold(
      appBar: new AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text('Register')),
      body: Column(children: <Widget>[
        SizedBox(
          height: 44.0,
        ),
        Text(
          'Welcome to Register',
          style: TextStyle(
            fontSize: 22.00,
          ),
        ),
        //Expanded(child: RegisterForm(key: Key("register_form"), title: title)),
        Expanded(child: RegisterForm(key: Key("register_form"))),
      ]),
    );
  }
}