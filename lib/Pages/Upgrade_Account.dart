import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class UpgradeAccount extends StatefulWidget {
  const UpgradeAccount({super.key});

  @override
  State<UpgradeAccount> createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeAccount> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Upgrade Account',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
    );
  }
}
