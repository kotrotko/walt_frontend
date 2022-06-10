import 'package:flutter/material.dart';
import 'package:gunio/ui/widgets/auth/register/complete_form.dart';

class RegisterCompletePage extends StatelessWidget {
  static const routeName = '/auth/register_complete';

  @override
  Widget build(BuildContext context) {
    return CompleteRegisterForm();
  }
}