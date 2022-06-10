import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:gunio/models/auth.dart';
import 'package:gunio/ui/screens/auth/login.dart';

final secureStorage = new FlutterSecureStorage();

logout(BuildContext context) {
  AuthTokens(accessToken: null, refreshToken: null).save();
  //AuthTokens(accessToken: '', refreshToken: '').save();

  Navigator.pushReplacementNamed(context, LogInScreen.routeName);
}