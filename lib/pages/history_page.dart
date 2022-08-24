import 'dart:io';
import 'package:cashback/models/AppUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Appuser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'History',
          style: TextStyle(
            fontFamily: 'SF Rounded',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xff202227),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("history").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              var taskLength = snapshot.data!.docs.length;
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                      itemCount: taskLength,
                      itemBuilder: (ctx, index) {
                        var item = snapshot.data!.docs[index];
                        final Timestamp timestamp =
                        item.get('date') as Timestamp;
                        final DateTime dateTime = timestamp.toDate();
                        final dateString =
                        DateFormat('K:mm:ss').format(dateTime);
                        return item.get('user_id') == Appuser!.uid
                            ? ListTile(
                          title: Text(
                            item.get('title'),
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            dateString.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            "Amount: " + item.get('amount').toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                            : Container();
                      }));
            }
          }),
    );
  }
}