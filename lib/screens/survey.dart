import 'package:flutter/material.dart';
import 'package:survey_project/services/form.dart';

class Survey extends StatefulWidget {
  final Function toggleView;
  Survey({this.toggleView});
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
          title: Text('SURVEY APP'),
          backgroundColor: Colors.yellow[900],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.account_circle,
                size: 35.0,
                color: Colors.white,
              ),
              label: Text(''),
              onPressed: () {
                widget.toggleView();
              },
            )
          ]),
      body: Form1(toggleView: widget.toggleView),
    );
  }
}
