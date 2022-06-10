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


class CompleteRegisterForm extends StatefulWidget {
  const CompleteRegisterForm({Key? key}) : super(key: key);

  final String routeName = '/auth/register';

  @override
  State<StatefulWidget> createState() {
    return _CompleteRegisterFormState();
  }
}

class _CompleteRegisterFormState extends State<CompleteRegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _password1Controller = TextEditingController();
  final _password2Controller = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _howDoYouKnowController = TextEditingController();

  bool isChecked = false;

  bool _pressed = false;
  late ValueChanged<String> onSubmit;

  late bool _passwordVisible;

  late double opacity;
  late TextInputType keyboardType;

  late String label;
  late String validationMessage;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _pressed = false;
  }

  switchPasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _password1Controller.dispose();
    _password2Controller.dispose();
    _howDoYouKnowController.dispose();
    super.dispose();
  }

  Widget inputFieldRegister(bool _passwordVisible, TextInputType keyboardType, Container suffixContainer, TextEditingController emailController, String validationMessage) {
    return Padding(
     padding: const EdgeInsets.all(8.0),
      child: TextFormFieldWidget(
        obscureText: _passwordVisible,
        keyboardType: keyboardType,
        suffixContainer: suffixContainer,
        validationMessage: validationMessage,
        controller: emailController,
        opacity: 0.0,
      ),
    );
  }

  Widget inputLabel(String textLabel){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
          text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: textLabel,
                  style: TextStyle(color: Colors.white, fontSize: 16.0,),
                ),
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red, fontSize: 16.0,),
                ),
              ]
          )
      ),
    );
  }

  Widget buttonPressedText () {
    return Text("SIGN UP",
      style: _pressed
        ? TextStyle(
          color: Colors.greenAccent)
        : TextStyle(
          color: Colors.grey),
  );
  }

  ButtonStyle pressedButtonStyle (){
    return ButtonStyle(
      backgroundColor: !_pressed
      ? MaterialStateProperty.all<Color>(Colors.greenAccent)
      : MaterialStateProperty.all<Color>(Colors.grey)
    );
  }

  // ElevatedButton? ButtonNotActive () {
  //   child: Text("COMPLETE SIGN UP", style: TextStyle(color: Colors.black));
  //   onPressed: () {
  //     setState(() {
  //       pressed = !pressed;
  //     });
  //     if (_formKey.currentState!.validate()) {
  //       APIClient().register(
  //       _password2Controller.text,
  //       _firstNameController.text,
  //       _lastNameController.text,
  //       _phoneNumberController.text,
  //       //_howDoYouKnowController.text).then((response) {
  //       _howDoYouKnowController.text,
  //       (response){
  //
  //       if (response.statusCode == 201) {
  //         APIClient().login(
  //           _phoneNumberController.text,
  //           _password2Controller.text,
  //             (response) {
  //               if (response.statusCode == 200) {
  //                 getCurrentTokens().then((currentTokens) async {
  //                 Navigator.pushReplacementNamed(
  //                   context, SuccessScreen.routeName);
  //                 });}});}});}
  //     print("Validation Error");
  //   };
  //   style: pressedButtonStyle();
  // //child: Text("SIGN UP", style: TextStyle(color: Colors.black)),
  //   //child: buttonPressedText(),
  // }
  //
  // ElevatedButton? buttonActive () {
  //   child: "l;l;l;l;";
  //   onPressed: () {};
  // }

  @override
  Widget build(BuildContext context) {

    Container suffixInvisible = Container(width: 1.0);

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.white;
    }
    
    return new Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/walter.png',
          scale: 12
          ),
        ),
        title: const Text ("Walt"),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Column(children:[

          SizedBox(height: 20.0),
          Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.grey[700],
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Container(
                    child: Text("Complete sign up",
                      style: TextStyle(color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    )
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 1300.0,
                  padding: EdgeInsets.all(8.0),
                  child: Form(
                      key: _formKey,
                      // Expanded widget was here
                      child: ListView(
                          children: [
                            inputLabel("Set password "),
                            inputFieldRegister(false, TextInputType.text, suffixInvisible, _password1Controller, "Set password"),
                            inputLabel("Confirm password "),
                            inputFieldRegister(false, TextInputType.text, suffixInvisible, _password2Controller, "Confirm password"),
                            inputLabel("First name "),
                            inputFieldRegister(false, TextInputType.text, suffixInvisible, _firstNameController, "First name"),
                            inputLabel("Last name "),
                            inputFieldRegister(false, TextInputType.text, suffixInvisible, _lastNameController, "Last name"),
                            // inputLabel("Phone number "),
                            // inputFieldRegister(false, TextInputType.phone, suffixInvisible, _phoneNumberController, "Enter email"),
                            // inputLabel("How did you hear about us? "),
                            // inputFieldRegister(false, TextInputType.text, suffixInvisible, _howDoYouKnowController, "Enter email"),

                            SizedBox(height: 15.0),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.black87,
                                      fillColor: MaterialStateProperty.resolveWith(getColor),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Flexible(
                                      child: RichText(
                                        text: TextSpan(
                                          style: TextStyle(fontSize: 16.0),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "I acknowledge that I have read, an agree to the "
                                            ),
                                            TextSpan(
                                              text: "Terms of use.",
                                              style: TextStyle(fontSize: 16.0, color: Colors.blue),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => TermsOfUse()),
                                                    );
                                                },),
                                            ]
                                          ),
                                        ),
                                      ),
                                    ],),
                              ),
                            ),
                              SizedBox(height: 20.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                //child: ButtonNotActive(),
                                child: ElevatedButton(
                                  child: Text("SIGN UP", style: TextStyle(color: Colors.black)),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.greenAccent),
                                  onPressed: () async {
                                    print("I am here!");
                                     // setState(() {
                                     //   _pressed = !_pressed;
                                     // });
                                      if (_formKey.currentState!.validate()) {
                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   const SnackBar(content: Text('Processing Data')),
                                        // );
                                        APIClient().register(
                                            _password2Controller.text,
                                            _firstNameController.text,
                                            _lastNameController.text,
                                            _phoneNumberController.text,
                                            _howDoYouKnowController.text,
                                                (response) {
                                              _pressed = !_pressed;
                                              if (response.statusCode == 201) {
                                                APIClient().login(
                                                    _phoneNumberController
                                                        .text,
                                                    _password2Controller.text,
                                                        (response) {
                                                      if (response
                                                          .statusCode ==
                                                          200) {
                                                        getCurrentTokens()
                                                            .then((
                                                            currentTokens) async {
                                                          Navigator
                                                              .pushReplacementNamed(
                                                              context,
                                                              SuccessScreen
                                                                  .routeName);
                                                        });
                                                      }
                                                    });
                                              }
                                            });
                                      }
                                      print("Validation Error");
                                      return null;
                                    //child: Text("SIGN UP", style: TextStyle(color: Colors.black));
                                    //child: buttonPressedText(),
                                  }),
                              ),
                            SizedBox(height: 25.0),
                          ]),
                    ),
                  ),
              ],
            ),),
        ]),
      ),
    );
  }
}