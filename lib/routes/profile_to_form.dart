import 'package:flutter/material.dart';
import 'package:survey_project/screens/profile.dart';
import 'package:survey_project/screens/survey.dart';

class ProfileToForm extends StatefulWidget {
  @override
  _ProfileToFormState createState() => _ProfileToFormState();
}

class _ProfileToFormState extends State<ProfileToForm> {
  bool showSurvey = false;
  void toggleView() {
    setState(() => showSurvey = !showSurvey);
  }

  @override
  Widget build(BuildContext context) {
    if (showSurvey) {
      return Container(
        child: Survey(toggleView: toggleView),
      );
    } else {
      return Container(
        child: Profile(toggleView: toggleView),
      );
    }
  }
}
