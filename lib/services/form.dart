import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:survey_project/shared/const.dart';

class Form1 extends StatefulWidget {
  final Function toggleView;
  Form1({this.toggleView});

  @override
  _Form1State createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  final _formKey = GlobalKey<FormState>();
  double rating1, rating2, rating3, rating4, rating5;
  String collegeName = "", year = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var visitorName = "";
  void inputData() async {
    final FirebaseUser user = await _auth.currentUser();
    visitorName = user.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Text("COLLEGE SURVEY FORM",
                  style: TextStyle(color: Colors.black, fontSize: 30.0)),
              SizedBox(
                height: 20.0,
              ),
              // Enter college name
              Container(
                  width: 300.0,
                  child: TextFormField(
                      decoration: textInputDecoration,
                      validator: (val) =>
                          val.isEmpty ? "Enter the college Name " : null,
                      onChanged: (val) {
                        setState(() {
                          collegeName = val;
                        });
                      })),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200.0,
                child: TextFormField(
                    decoration: yrInputDecoration,
                    validator: (val) => val.isEmpty || val.length > 4
                        ? "Enter a valid year"
                        : null,
                    onChanged: (val) {
                      setState(() {
                        year = val;
                      });
                    }),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text("The Lecturer or faculty :",
                  style: TextStyle(color: Colors.black, fontSize: 25.0)),
              Text("(Rate the lecturer/faculty on a Scale of 0-5)",
                  style: TextStyle(color: Colors.red, fontSize: 12.0)),
              SizedBox(
                height: 10.0,
              ),
              Text("was well-prepared ",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              RatingBar(
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating1 = rating;
                },
              ),
              Text("was effective in leading the class",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              RatingBar(
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating2 = rating;
                },
              ),

              Text("was good at explaining things ",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              RatingBar(
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating3 = rating;
                },
              ),

              Text("gave interesting and informative classes ",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              RatingBar(
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating4 = rating;
                },
              ),

              Text("was addressing the doubts effectively ",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              RatingBar(
                glowColor: Colors.green[300],
                initialRating: 2.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  rating5 = rating;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                  color: Colors.red[700],
                  onPressed: () async {
                    // save rating to the firebase
                    await inputData();

                    double totalRating =
                        rating1 + rating2 + rating3 + rating4 + rating5;

                    double scaleFactor =
                        (totalRating / 25.0 * 900).roundToDouble();

                    final CollectionReference surveyCollection =
                        Firestore.instance.collection('surveys');

                    await surveyCollection.add({
                      'visitor_ID': visitorName,
                      'collage_name': collegeName,
                      'year': year,
                      'rating1': rating1,
                      'rating2': rating2,
                      'rating3': rating3,
                      'rating4': rating4,
                      'rating5': rating5,
                      'total_rating': totalRating,
                      'scale': scaleFactor,
                    });

                    if (_formKey.currentState.validate()) {
                      setState(() => widget.toggleView());
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: Colors.white))),
            ])));
  }
}
