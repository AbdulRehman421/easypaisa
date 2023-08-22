import 'dart:convert';

import 'package:easypaisa/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../Apis/api_keys.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _key = GlobalKey<FormState>();
   TextEditingController fNameController = TextEditingController();
   TextEditingController lNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController cnicController = TextEditingController();
   TextEditingController passwordController = TextEditingController();

  final maskFormatterPhone = new MaskTextInputFormatter(
      mask: '03#########',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );
  final maskFormatterCnic = new MaskTextInputFormatter(
      mask: '#############',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  Future<void> register(phone, password, fName, lName, email, cnicNumber, ) async {


    var uri = Uri.parse(Apis.signUpApi);
    var post = http.MultipartRequest('POST', uri);
    post.fields['phone_number'] = phone;
    post.fields['password'] = password;
    post.fields['fname'] = fName;
    post.fields['lname'] = lName;
    post.fields['email'] = email;
    post.fields['cnic'] = cnicNumber;
    post.fields['role'] = 'user';


    var response = await post.send();
    var responsed = await http.Response.fromStream(response);

    try {
      if (responsed.statusCode == 200) {
        final responsedData = json.decode(responsed.body);
        print("Data $responsedData");
        print("Register Successfully");
        Fluttertoast.showToast(
            msg: "Register Successfully",
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 18);

      } else {
        print("Error to register");
        Fluttertoast.showToast(
            msg: responsed.body,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 18);

      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 18);

    }
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
      key: _key,
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const SizedBox(
            height: 50,
          ),
          Container(
              height: 60,
              child: Image.asset('assets/images/ep2.png',width: 300,height: 300,)),
          SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: fNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "First Name",
                  labelText: 'Enter First Name'

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter First Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: lNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "Last Name",
                  labelText: 'Enter Last Name'

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Last Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "abc@gmail.com",
                  labelText: 'Enter Email'

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [maskFormatterPhone],
              controller: phoneController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "03001234567",
                  labelText: 'Enter Phone'

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Phone Number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextFormField(
              inputFormatters: [maskFormatterCnic],
              keyboardType: TextInputType.phone,
              controller: cnicController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "3630201234567",
                  labelText: 'Enter CNIC'

              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter CNIC Number';
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
          SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(left: 120,right: 120),
            child: ElevatedButton(
              onPressed: () {

                if (_key.currentState!.validate()) {
                  register(
                      phoneController.text,
                      passwordController.text,
                      fNameController.text,
                      lNameController.text,
                      emailController.text,
                      cnicController.text,
                      );
                  _key.currentState!.reset();
                }
              },
             style: ButtonStyle(
               backgroundColor: MaterialStatePropertyAll(Colors.green),
             ),
              child: const Text(
                'Register',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",style: TextStyle(fontSize: 18),),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Text(' Login',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold , fontSize: 18),))
            ],
          ),
          SizedBox(height: 60,),
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