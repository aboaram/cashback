import 'dart:io';

import 'package:cashback/pages/sub%20pages/send_invite.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_five_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_four_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_three_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_two_tasks.dart';
import 'package:cashback/utility/task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/custom_nav_bar.dart';
import '../../loader_page.dart';
import '../home_page_sub.dart';
import '../quetsion_page.dart';

class VipOneTasks extends StatefulWidget {
  var vip;

  VipOneTasks({this.vip});

  @override
  _VipOneTasksState createState() => _VipOneTasksState();
}

class _VipOneTasksState extends State<VipOneTasks> {
  final Appuser = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

// image pciker code
  XFile? _image;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image = image;
    } else {
      _image = null;
    }
    setState(() {});
  }

  List<String>? SavedTasks;
  String? _dateTime;
  Future getSavedTaskId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SavedTasks = (await prefs.getKeys()).toList() as List<String>?;
    print("SavedTasks: ${SavedTasks}");
  }

  setDateTime()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _dateTime = (await prefs.setString('dateTime', DateTime.now().toString())) as String?;
    print("_dateTime: ${_dateTime}");
  }

  clearPref()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedDate = await prefs.getString('dateTime').toString();
    print("savedDate: ${savedDate}");
    if(savedDate !=  DateTime.now().toString()){
      await prefs.clear();
    }
    else{
      setDateTime();
    }
    // prefs.clear();
  }

  @override
  initState(){
    super.initState();
    getSavedTaskId();
    clearPref();
  }

  @override
  Widget build(BuildContext context) {
    final Appuser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      // bottomNavigationBar: MaterialButton(
      //   minWidth: double.infinity,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(30),
      //   ),
      //   onPressed: () {},
      //   color: Colors.lightGreenAccent,
      //   child: Text(
      //     'Completed: 3',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff202227),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("task ").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              var taskLength = snapshot.data!.docs.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView.builder(
                    itemCount: widget.vip == 0
                        ? 2
                        : widget.vip == 1
                            ? 5
                            : widget.vip == 2
                                ? 8
                                : widget.vip == 3
                                    ? 18
                                    : widget.vip == 4
                                        ? 32
                                        : widget.vip == 5
                                            ? taskLength
                                            : taskLength,
                    itemBuilder: (ctx, index) {
                      var item = snapshot.data!.docs[index];

                      return SavedTasks!.contains("doneTask${index}") ? Container() :
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          onTap: () async {
                            if (await canLaunch(item.get("link"))) {
                              await launch(item.get("link"));
                            } else {
                              throw 'Could not launch ${item.get("link")}';
                            }
                          },
                          trailing: GestureDetector(
                            onTap: () async{
                              SharedPreferences pref = await SharedPreferences.getInstance();
                              await getImage();


                              if(_image != null){
                                var _currentBalance = await users.doc(Appuser!.uid).get().then((value) {
                                  var balance = value.get('balance');
                                  var newBalance;

                                  // new balance
                                  if(widget.vip == 0){
                                    newBalance = balance + 0.2;
                                  }else if(widget.vip == 1){
                                    newBalance = balance + 1.1;
                                  }else if(widget.vip == 2){
                                    newBalance = balance + 2;
                                  }else if(widget.vip == 3){
                                    newBalance = balance + 2.8;
                                  } else if(widget.vip == 4){
                                    newBalance = balance + 3.5;
                                  }
                                  print("balance $newBalance");
                                  // update balance
                                  users.doc(Appuser!.uid).update({
                                    'balance': newBalance,
                                  });
                                });
                                  /// saved the task which user completed
                                String taskID =  snapshot.data!.docs[index].id;
                                await pref.setString("doneTask${index}", taskID);
                                await getSavedTaskId();
                                setState(() {});
                              }
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.upload,
                                  color: Colors.green,
                                ),
                                Text(
                                  "Upload",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                          leading: Image.network(
                            item.get('logo'),
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            item.get('title'),
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          subtitle: Text(item.get('description'), style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
