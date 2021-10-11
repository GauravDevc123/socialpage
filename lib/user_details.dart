import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final String uid;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  UserDetailsPage(this.uid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                    stream: collectionReference.doc("users").snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var userDoc = snapshot.data as Map;
                      return new Column(
                        children: [
                          Text(userDoc["UserName"]),
                          Text(userDoc["age"]),
                          Text(userDoc["bio"]),
                          Text(userDoc["hometown"]),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
