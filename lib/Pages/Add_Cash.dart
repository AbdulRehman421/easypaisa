import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class AddCash extends StatefulWidget {
  const AddCash({super.key});

  @override
  State<AddCash> createState() => _AddCashState();
}

class _AddCashState extends State<AddCash> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Funds Transfer',style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),

      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: CupertinoContextMenu.kEndBoxShadow,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  width: 380,
                  height: 180,
                  child: Container(
                    margin: EdgeInsets.only(left: 35 , top: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/easypaisalogo.png',width: 60),
                         SizedBox(height: 15,),
                         Text('easypaisa Mobile Account',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.green),),
                        SizedBox(height: 7,),

                        Text('Rs. 1000.05',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),),
                        SizedBox(height: 7,),

                        Row(
                          children: [
                           Icon(Icons.align_vertical_bottom_outlined,color: Colors.green,),
                            Text('View Transactions Limits',style: TextStyle( fontSize: 12),),
                            Icon(Icons.arrow_forward_ios,size: 16,color: Colors.green,)



                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  // color: Colors.green,
                margin:  EdgeInsets.only(top: 40,bottom: 30),
                  width: 380,
                  child: Text('Add Cash Options',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: CupertinoContextMenu.kEndBoxShadow,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: 380,
                height: 280,

                 child: const Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       children: [
                         SizedBox(width: 15,),
                         Icon(Icons.account_balance_outlined,color: Colors.green,size: 26),
                         SizedBox(width: 15,),
                         Text('Link Any Bank Account to Add Cash',style: TextStyle( fontSize: 16)),
                         SizedBox(width: 35,),
                         Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                       ],
                     ),
                     Divider(
                       color: Colors.black,
                       indent: 30,
                       endIndent: 40,
                     ),
                     Row(

                       children: [
                         SizedBox(width: 15,),
                         Icon(Icons.credit_card,color: Colors.green,size: 26),
                         SizedBox(width: 15,),
                         Text('Link Any Debit/Credit Card to Add Cash',style: TextStyle( fontSize: 16)),
                         SizedBox(width: 12,),
                         Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                       ],
                     ),
                     Divider(
                       color: Colors.black,
                       indent: 30,
                       endIndent: 40,
                     ),
                     Row(

                       children: [
                         SizedBox(width: 15,),
                         Icon(Icons.money,color: Colors.green,size: 26),
                         SizedBox(width: 15,),
                         Text('Add Cash via Bank Transfer',style: TextStyle( fontSize: 16)),
                         SizedBox(width: 95,),
                         Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                       ],
                     ),

                   ],
                 ),
              ),
              Container(
                // color: Colors.green,
                  margin:  EdgeInsets.only(top: 40,bottom: 30),
                  width: 380,
                  child: Text('Other Add Cash Options',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),)),
              Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: CupertinoContextMenu.kEndBoxShadow,
                  borderRadius: BorderRadius.circular(20),
                ),

                width: 380,
                height: 280,

                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.credit_card,color: Colors.green,size: 26),
                        SizedBox(width: 15,),
                        Text('Add Other Bank Cards',style: TextStyle( fontSize: 16)),
                        SizedBox(width: 135,),
                        Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      indent: 30,
                      endIndent: 40,
                    ),
                    Row(

                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.account_balance_outlined,color: Colors.green,size: 26),
                        SizedBox(width: 15,),
                        Text('From Your Bank Account',style: TextStyle( fontSize: 16)),
                        SizedBox(width: 115,),
                        Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      indent: 30,
                      endIndent: 40,
                    ),
                    Row(

                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.money,color: Colors.green,size: 26),
                        SizedBox(width: 15,),
                        Text('From EasyPaisa Shop',style: TextStyle( fontSize: 16)),
                        SizedBox(width: 135,),
                        Icon(Icons.arrow_forward_ios,color: Colors.green,size: 18,)
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
