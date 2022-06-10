import 'package:flutter/material.dart';

import 'package:gunio/ui/widgets/auth/login/form.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = '/auth/login';

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}