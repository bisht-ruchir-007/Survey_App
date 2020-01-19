import 'package:flutter/material.dart';
import 'package:survey_project/screens/past_surveys.dart';
import 'package:survey_project/services/auth.dart';

class Profile extends StatefulWidget {
  final Function toggleView;
  Profile({this.toggleView});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();

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
                Icons.assignment,
                size: 30.0,
                color: Colors.white,
              ),
              label: Text(''),
              onPressed: () {
                widget.toggleView();
              },
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.backspace,
                size: 30.0,
                color: Colors.white,
              ),
              label: Text(''),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ]),
      body: Past_Surveys(),
    );
  }
}
