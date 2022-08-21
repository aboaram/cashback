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
import 'package:url_launcher/url_launcher.dart';

import '../../../widget/custom_nav_bar.dart';
import '../../loader_page.dart';
import '../home_page_sub.dart';
import '../quetsion_page.dart';

class VipOneTasks extends StatefulWidget {
  const VipOneTasks({Key? key}) : super(key: key);

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
    if(image != null){
      _image = image;
    } else{
      _image = null;
    }
    print("_image: "+ _image.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Appuser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      bottomNavigationBar: MaterialButton(
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ), onPressed: () {  },
        color: Colors.lightGreenAccent,
        child: Text(
          'Completed: 3',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
      backgroundColor: const Color(0xff202227),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("task ").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            print("snapshot.data ${snapshot.data!.docs.length}");
            if(snapshot.hasError){
              return Text("Error ${snapshot.error}");
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.data!.docs.length == 0){
              return Center(child: Text("No Task"));
            }
            else{
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) {
                      var item = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          onTap: ()async{
                            // url launccher
                            if(await canLaunch(item.get("redirect_link"))){
                            await launch(item.get("redirect_link"));
                            }else {
                            throw 'Could not launch ${item.get("redirect_link")}';
                            }
                          },
                          trailing: GestureDetector(
                            onTap: (){
                              getImage();
                            },
                            child: Column(
                              children: [
                                Icon(Icons.upload, color: Colors.green,),
                                Text("Upload", style: TextStyle(color: Colors.green),),
                              ],
                            ),
                          ),
                          leading:
                          Image.network(item.get('logo'),height: 40,width: 40,),
                          title: Text(item.get('title'),
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          subtitle: Text(item.get('description'),
                              style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      );
                    }),
              );
            }

      }),);
  }
}
