import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
