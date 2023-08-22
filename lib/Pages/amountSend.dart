import 'dart:convert';
import 'package:easypaisa/Pages/sharedprefrence.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Apis/api_keys.dart';
import '../HomePage.dart';

class AmountSend extends StatefulWidget {
  final String? results;

  AmountSend({super.key, required this.results});

  @override
  State<AmountSend> createState() => _AmountSendState(results!);
}

class _AmountSendState extends State<AmountSend> {
  String? token = MySharedPrefClass.preferences!.getString('token');
  late String results;
  final _key = GlobalKey<FormState>();

  _AmountSendState(this.results);

  String get cnic => results;


  @override
  void initState() {
    super.initState();
    fetchData(cnic, token);
  }

  String fname = '';
  String lname = '';
  String number = '';
  String qrcode = '';

  void fetchData(String cnic, mToken) async {
    try {
      if (mToken == null || mToken == "") {
        print('Token not found');
        return;
      }

      Response response = await post(Uri.parse(Apis.qrCodeApi), headers: {
        'Authorization': 'Token $mToken',
      }, body: {
        'cnic': cnic
      });
//
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        // Process the retrieved data as needed
        print(' qr dta ${data}');
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

  transferMoney(String? cnic, String? amount, String? mToken) async {
    try {
      Response response = await post(Uri.parse(Apis.transferMoneyApi), headers: {
        'Authorization': 'Token $mToken',
      }, body: {
        'amount': amount,
        'cnic': cnic,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print('Data: $data');
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'easypaisa Transfer',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Image.asset('assets/images/ep2.png')),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green, borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Center(
                            child: Text(
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                'Sending to easypaisa account'),
                          ),
                        ),
                        Text(
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            'Account Name : ${fname} ${lname}'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              'Account Cnic ${widget.results}'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Enter Amount',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 180,
                  height: 100,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    style: TextStyle(fontSize: 24),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.green,
                      labelText: 'Enter Amount',
                      prefix: Text('Rs '),
                      labelStyle: TextStyle(fontSize: 24, color: Colors.green),
                      border:
                      OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.circular(20)),
                      focusColor: Colors.green,

                      hintStyle: TextStyle(fontSize: 24),
                      hintText: '0',
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
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        transferMoney(cnic, amountController.text, token);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => HomePage(),));
                      }

                    },
                    child: Text(
                      'Send Rs ${amountController.text}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
