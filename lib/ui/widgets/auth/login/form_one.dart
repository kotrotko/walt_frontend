import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gunio/ui/widgets/input_field/input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  //final _emailController = controller;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final TextInputType keyboardTypeEmail = TextInputType.emailAddress;
  final TextInputType keyboardTypePassword = TextInputType.text;

  late bool _passwordVisible;
  late String validationMessage;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  switchPasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon visibilityOn = Icon(Icons.visibility, color: Colors.white);
    Icon visibilityOff = Icon(Icons.visibility_off, color: Colors.white);
    IconButton suffixIcon = IconButton(
      icon: _passwordVisible
          ? visibilityOff
          : visibilityOn,
      onPressed: switchPasswordVisibility,);

    Container suffixInvisible = Container(width: 1.0);

    final TextInputType keyboardType = TextInputType.text;

    Container suffixVisible = Container(
        width: 20.0,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
        child: IconButton(
            icon: _passwordVisible
                ? visibilityOff
                : visibilityOn,
            onPressed: switchPasswordVisibility
        )
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text ("Test"),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.white),
              ),
              child: TextButton(
                onPressed: (){
                    print("OK");
                },
                child: Text("Sign up", style: TextStyle(fontSize: 18.0, color: Colors.blue, decoration: TextDecoration.underline)),
              ),),]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Container(
              margin: EdgeInsets.all(10.0),
              color: Colors.grey[700],
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0),
                    child: Form(
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormFieldWidget(
                          obscureText: false,
                          keyboardType: keyboardType,
                          validationMessage: 'asd',
                          suffixContainer: suffixInvisible,
                          controller: _emailController,
                          opacity: 0.0,
                        ),
                        TextFormField(
                            obscureText: _passwordVisible,
                            keyboardType: keyboardType,
                            controller: _passwordController
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(332, 60),
                                    primary: Colors.greenAccent),
                                //onPressed: () async {
                                onPressed: () {
                                  debugPrint("pressed!");
                                  print('entered email: ${_emailController.text}');
                                  print('entered password: ${_passwordController.text}');
                                },
                                child: IconTheme(
                                  data: IconThemeData(color: Theme
                                      .of(context)
                                      .primaryColor),
                                  child: Text("SIGN IN",
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    //TextButton(child: Text("Reset your password"), onPressed: (){}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}