import 'package:easypaisa/HomePage.dart';
import 'package:flutter/material.dart';
class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallet',style: TextStyle(color: Colors.black),),
        centerTitle: true,
         elevation: 0,
         backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      backgroundColor: Colors.white,

    );
  }
}
