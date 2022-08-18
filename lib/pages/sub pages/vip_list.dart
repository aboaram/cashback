import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class VipList extends StatefulWidget {
  const VipList({Key? key}) : super(key: key);

  @override
  _VipListState createState() => _VipListState();
}

class _VipListState extends State<VipList> {
  @override
  Widget build(BuildContext context) {
    final vipss = Provider.of<QuerySnapshot>(context);
    print(vipss);
    return Container();
  }
}
