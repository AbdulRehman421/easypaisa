import 'dart:convert';

import 'package:easypaisa/Auth/register.dart';
import 'package:easypaisa/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Apis/api_keys.dart';
import '../Pages/sharedprefrence.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void dispose() {
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void login(String phoneNumber, String password) async {

    try {
      Response response = await post(
        Uri.parse(Apis.loginApi),
        body: {
          'phone_number': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;
        print(json['fname']);
        print(json['lname']);
        print(json['wallet']);
        print('Login successfully');
        MySharedPrefClass.preferences!.setString('token', json['token']);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
        );

      } else {
        var data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['detail'].toString())),
        );


      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred')),
      );

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _key,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Container(
                height: 60,
                child: Image.asset('assets/images/ep2.png',width: 300,height: 300,)),            const SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                  labelText: 'Enter Phone Number',
                  hintText: "03001234567",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  labelText: 'Enter Password'
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 120,right: 120),

              child: ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    login(phoneController.text,
                        passwordController.text);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                ),
                child: const Text(
                  'Login',
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: TextStyle(fontSize: 18),),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                  },
                  child: Text(' Sign up',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold , fontSize: 18),))
            ],
          ),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                "Powered By Easypaisa",style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }


}