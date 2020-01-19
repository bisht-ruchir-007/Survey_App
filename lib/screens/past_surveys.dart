import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:survey_project/shared/loading.dart';

class Past_Surveys extends StatefulWidget {
  @override
  _Past_SurveysState createState() => _Past_SurveysState();
}

class _Past_SurveysState extends State<Past_Surveys> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('surveys').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Loading();
        return ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return ListTile(
                leading: CircleAvatar(
                  radius: 27.0,
                  //intesity
                  backgroundColor: Colors.green[700],
                ),
                title: Text(document['collage_name']),
                dense: false,
                subtitle: Text("In Year : " + document['year']),
                trailing:
                    Text("Rating : " + document['total_rating'].toString()));
          }).toList(),
        );
      },
    );
  }
}
