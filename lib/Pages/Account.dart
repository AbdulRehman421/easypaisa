import 'dart:async';
import 'dart:convert';

import 'package:easypaisa/HomePage.dart';
import 'package:easypaisa/HomePageLogin.dart';
import 'package:easypaisa/Pages/sharedprefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Apis/api_keys.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override

  String? token = MySharedPrefClass.preferences!.getString('token');

  void initState(){
    super.initState();
     fetchData(token);
  }

  String fname = '';
  String lname = '';
  String email = '';
  int cnic = 0;
  String number ='';
  int wallet = 0;
  String qrcode = '';

  void fetchData(mToken) async {
    try {
      if (mToken == null || mToken == "") {
        // Token not found, handle accordingly
        print('Token not found');
        return;
      }

      Response response = await get(Uri.parse(Apis.profileApi), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Token $mToken',
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Process the retrieved data as needed
        print(data);
        print(data['fname']);
        setState(() {
          fname = data['fname'];
          lname = data['lname'];
          cnic = data['cnic'];
          email = data['email'];
          number = data['phone_number'];
          wallet = data['wallet'];
          qrcode = data['qrcode'];


        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }

  Widget build(BuildContext context) {
    print('Hello Name${fname}');
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            showLogoutDialogue();
          }, icon: Icon(Icons.login,color: Colors.black,))
        ],
        centerTitle: true,
        title: Text('Account Details',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 50),
              child: Image.asset('assets/images/ep2.png',width: 300,height: 300,)),
          Container(
            margin: EdgeInsets.only(left: 40,),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                child:
                      Text(style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold) ,
                          'Name : ${fname} ${lname}'),
                  ),
                Container(
                child:
                      Text(style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold) ,
                          'Email : ${email}'),
                  ),
                Container(
                child:
                      Text(style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold) ,
                          'Cnic : ${cnic.toString()}'),
                  ),
                Container(
                child:
                      Text(style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold) ,
                          'Phone No : ${number.toString()}'),
                  ),


              ],
            ),
          ),
        ],
      ),

    );
  }
  void showLogoutDialogue()async{
      return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Center(
                   child: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox( height: 30,),

                Text('Are you want to Logout'),
                SizedBox( height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.green)
                        ),
                        onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text('No')),

                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.green)
                        ),
                        onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageLogin(),));
                    }, child: Text('Yes')),

                  ],
                ),
              ],
            ),
          ),

        );

      },);
  }
}
