import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_project/services/auth.dart';
//import 'package:survey_project/routes/profile_to_form.dart';
import 'package:survey_project/wrapper.dart';

import 'model/user.dart';
//import 'package:survey_project/screens/survey.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
