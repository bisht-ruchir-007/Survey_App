import 'package:flutter/material.dart';
import 'package:survey_project/shared/const.dart';
import 'package:survey_project/shared/loading.dart';

import 'auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = "", password = "", name = "", error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.yellow[200],
            appBar: AppBar(
              backgroundColor: Colors.yellow[900],
              elevation: 0.0,
              title: Text('SURVEY APP',
                  style: TextStyle(color: Colors.white, fontSize: 35.0)),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('SignIn'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey, // for validation (state of the form)
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Text(
                      "REGISTER",
                      style:
                          TextStyle(color: Colors.amber[900], fontSize: 30.0),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: emailInputDecoration,
                        validator: (val) =>
                            val.isEmpty ? "Email field is Empty !!!" : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: emailInputDecoration,
                        validator: (val) => val.isEmpty ? "Empty !!!" : null,
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: passwordInputDecoration,
                        validator: (val) => val.length < 6
                            ? "Password Length must be more than 6 characters !!! "
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        color: Colors.red[700],
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, name);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'please supply a valid Email';
                              });
                            }
                          }
                        },
                        child: Text('Sign Up',
                            style: TextStyle(color: Colors.white))),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
