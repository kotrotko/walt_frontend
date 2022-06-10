import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'dart:async';

import 'package:gunio/api/client.dart';
import 'package:gunio/models/auth.dart';
import 'package:gunio/screens/success_screen.dart';
import 'package:gunio/ui/widgets/input_field/input_field.dart';
import 'package:gunio/ui/widgets/auth/login/form.dart';
import 'package:gunio/screens/terms_of_use_screen.dart';
import 'package:gunio/screens/private_policy_screen.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  //final String title;

  @override
  State<StatefulWidget> createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _howDoYouKnowController = TextEditingController();

  //bool obscure = false;
  late bool _passwordVisible;
  late double opacity;
  late TextInputType keyboardType;


  late String validationMessage;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  switchPasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _howDoYouKnowController.dispose();
    super.dispose();
  }

  Widget inputFieldRegister(String label, bool _passwordVisible, TextInputType keyboardType, Container suffixContainer, TextEditingController emailController, String validationMessage) {
    return TextFormFieldWidget(
      obscureText: _passwordVisible,
      keyboardType: keyboardType,
      suffixContainer: suffixContainer,
      validationMessage: validationMessage,
      controller: emailController,
      opacity: 0.0,
    );
  }


  @override
  Widget build(BuildContext context) {
    Container suffixInvisible = Container(width: 1.0);

    return new Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .primary,
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset('assets/walter.png',
                scale: 12
            ),
          ),
          title: const Text ("Walt"),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme().apply(bodyColor: Colors.white),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginForm()));
                },
                child: Text("Sign in", style: TextStyle(fontSize: 18.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline)),
              ),),
          ]
      ),
      body: Column(children: [
        SizedBox(height: 100.0),
        Container(
          margin: EdgeInsets.all(10.0),
          color: Colors.grey[700],
          child: Column(
            children: [
              SizedBox(height: 25.0),
              Container(
                  child: Text("Sign up for Walt",
                    style: TextStyle(color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
              ),
              SizedBox(height: 25.0),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Email - professional or business email strongly preferred",
                    style: TextStyle(color: Colors.white,
                      fontSize: 18.0,
                    ),
                  )
              ),
              Container(
                height: 280.0,
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                      children: [
                        Column(children: <Widget>[
                          inputFieldRegister("Email", false,
                              TextInputType.phone, suffixInvisible,
                              _phoneNumberController, "Phone number"),
                          SizedBox(height: 15.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(332, 60),
                                primary: Colors.greenAccent),
                            onPressed: () {
                              sendEmail;
                            },

                            child: Text("SIGN UP",
                                style: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(fontSize: 16.0),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'By signing up you agree to our ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TermsOfUse()),
                                          );
                                        },
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: 'Private Policy',
                                      style: TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PrivatePolicy()),
                                          );
                                        },
                                    ),
                                  ]
                              ),

                            ),
                          ),
                        ]),
                      ]),
                ),
              ),
            ],
          ),),
      ]),
    );
  }

  Future sendEmail(
  //     @required String name,
  //     @required String email,
  //     @required String subject,
  //     @required String message,
  ) async {
    String email = "gkurmanova@gmail.com";
    String password = "123";

    final smtpServer = gmail("gkurmanova@gmail.com", "123");

    final message = Message()
      ..from = Address(email, 'Your name')
      ..recipients.add('gkurmanova@gmail.com')
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      ..text = 'Test.'
      ..html = "<h1>Test</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }


  }
  //
  // Widget buildTextField({
  // required String title,
  //   required TextEditingController controller,
  //   int maxLines = 1
  // }),
    // final email = 'gkurmanova@gmail.com';
    // final token = '';
    //
    // final smtpServer = gmailSaslXoauth2(email, token);
    // final message = Message()
    //   ..from = Address(email, "Kitty")
    //   ..recipients = ['gkurmanova@gmail.com']
    //   ..subject = "Hello Kitty"
    //   ..text = "This is a test email";
    //
    // try {
    //   await send(message, smtpServer);
    //
    //   showSnackBar('Sent email successfully!');
    // } onMailerException catch (e) {
    //   print(e);
    // }
    //
    // void showSnackBar(String text){
    //   final snackBar = SnackBar(
    //     content: Text(
    //       text,
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     backgroundColor: Colors.green,
    //   );

}}
