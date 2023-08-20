import 'dart:convert';

import 'package:easypaisa/Pages/sharedprefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qr_code_scanner/src/types/barcode.dart';

import '../Apis/api_keys.dart';
import '../HomePage.dart';

class SendMoney extends StatefulWidget {
 final String? results;

   SendMoney({super.key, required  this.results});

  @override
  State<SendMoney> createState() => _SendMoneyState(results!);
}

class _SendMoneyState extends State<SendMoney> {

  String? token = MySharedPrefClass.preferences!.getString('token');
  late String results;

  _SendMoneyState(this.results);
  String get cnic => results;

  @override
  void initState() {
    super.initState();
    fetchData(cnic , token);
  }

  String fname = '';
  String lname = '';
  int wallet = 0;
  String number ='';

  String qrcode = '';

  void fetchData(String cnic , mToken) async {
    try {
      if (mToken == null || mToken == "") {
        // Token not found, handle accordingly
        print('Token not found');
        return;
      }

      Response response = await post(Uri.parse(Apis.qrCodeApi), headers: {
        'Authorization': 'Token $mToken',
      },
     body: {
        'cnic' : cnic
     }
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Process the retrieved data as needed
        print(data);
        print(data['fname']);
        setState(() {
          fname = data['fname'];
          lname = data['lname'];

        });
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("error: $e");
    }
  }
  TextEditingController amountController = TextEditingController();

  // String get results => result;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('easypaisa Transfer',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Column(
        children: [
          Container(
              width: 200,
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Image.asset('assets/images/ep2.png')),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                    child: Center(
                      child: Text(
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                          'Sending to easypaisa account'),
                    ),
                  ),
                  Text(
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),
                      'Account Name : ${fname} ${lname}'),
                  SizedBox(height: 10,),

                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),
    'Account Cnic ${widget.results}'),
                  ),
                  // Container(
                  //   child: Text('Cnic ${widget.results}'),
                  //
                  // ),
    ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,bottom: 20),
            child:Text('Enter Amount',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ),

          Container(
            width: 50,

            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(
                fillColor: Colors.green,
                border: InputBorder.none,
                hintText: 'Rs 0',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)
                ),
                onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
            }, child: Text('Send Rs',style: TextStyle(fontSize: 24),)),
          )


        ],
      ),
    );
  }
}
