import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gunio/api/client.dart';
import 'package:gunio/models/auth.dart';
import 'package:gunio/ui/widgets/input_field/input_field.dart';
import 'package:gunio/ui/widgets/auth/register/form.dart';

import 'package:gunio/screens/success_screen.dart';
import 'package:gunio/screens/terms_of_use_screen.dart';
import 'package:gunio/screens/private_policy_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
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
    _emailController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${_emailController.text}');
  }

  switchPasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

    //opacity (icon: Icon(Icons.visibility, color: Colors.grey[800]), onPressed: (){});
    @override
    Widget build(BuildContext context) {
      Icon visibilityOn = Icon(Icons.visibility, color: Colors.white);
      Icon visibilityOff = Icon(Icons.visibility_off, color: Colors.white);
      IconButton suffixIcon = IconButton(
            icon: _passwordVisible
                ? visibilityOff
                : visibilityOn,
            onPressed: switchPasswordVisibility, );

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
              actions: [
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.white),
                    textTheme: TextTheme().apply(bodyColor: Colors.white),
                  ),
                  child: TextButton(
                    onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterForm()));
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
                      SizedBox(height: 25.0),
                      Container(
                          child: Text("Sign in to Walt",
                            style: TextStyle(color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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
                          TextFormFieldWidget(
                            obscureText: _passwordVisible,
                            keyboardType: keyboardType,
                            suffixContainer: suffixVisible,
                            validationMessage: 'sdfsd',
                            opacity: 0.0,
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
                                        //_printLatestValue();
                                        if (_formKey.currentState!.validate()) {
                                          //print('entered email: ${_emailController.text}');}
                                          //print('entered password: ${_passwordController.text}');
                                          APIClient().login(
                                            _emailController.text,
                                            _passwordController.text,
                                               (loginResponse) async =>
                                                 {
                                                   if (loginResponse.statusCode == 200)
                                                      {
                                                        getCurrentTokens().then((
                                                          currentTokens) {
                                                            Navigator.pushReplacementNamed(
                                                         context, SuccessScreen.routeName,
                                                            arguments: AuthTokens(
                                                              accessToken:
                                                                currentTokens!.accessToken,
                                                              refreshToken:
                                                                currentTokens.refreshToken));
                                               }),
                                             }
                                          else
                                            {print('fail'),}
                                          });
                                        }
                                      },
                                      child: IconTheme(
                                        data: IconThemeData(color: Theme
                                            .of(context)
                                            .primaryColor),
                                        child: Text("SIGN IN", style: TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 25.0),
                                  Container(
                                    child: Text.rich(
                                      TextSpan(
                                        style: TextStyle(fontSize: 16.0),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Read our ', style: TextStyle(color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: 'Terms of Service', style: TextStyle(color: Colors.blue),
                                            recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => TermsOfUse()),
                                              );
                                            },
                                          ),
                                          TextSpan(
                                            text: ' and ', style: TextStyle(color: Colors.white),
                                          ),
                                          TextSpan(
                                            text: 'Private Policy', style: TextStyle(color: Colors.blue),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => PrivatePolicy()),
                                                );
                                              },
                                            ),
                                        ]
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   child: TextButton(
                                  //     child: Text("Register", style: TextStyle(color: Colors.cyan)),
                                  //     style: TextButton.styleFrom(
                                  //       primary: Colors.white,
                                  //       side: BorderSide(color: Colors.cyan, width: 2),),
                                  //     onPressed: () async {
                                  //       toRegisterPage();
                                  //     },
                                  //   ),),
                                  SizedBox(height: 20.0),
                                ],
                              ),

                              /*
                                TextButton(
                              onPressed: () async {
                                toRegisterPage();
                              },
                              child: Text("Register"),
                            ),*/
                            ]),
                          ),
                        //TextButton(child: Text("Reset your password"), onPressed: (){}),
                        ),
                      SizedBox(height: 10.0)
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                    child: Text("Reset your password", style: TextStyle(fontSize: 18.0, color: Colors.blue))
                ),
              ],
            ),
          ),
      );
  }
}