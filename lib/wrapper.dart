import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_project/routes/profile_to_form.dart';
import 'package:survey_project/services/auth_page.dart';

import 'model/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    // if user is login ? Profile screen : Login Screen
    final user = Provider.of<User>(context);

    // return either Home or auth widget
    // return Authenticate();
    if (user == null) {
      return Authenticate();
    } else {
      return ProfileToForm();
    }
  }
}
