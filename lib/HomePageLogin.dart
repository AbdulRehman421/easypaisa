import 'package:easypaisa/Auth/register.dart';
import 'package:easypaisa/Pages/Add_Cash.dart';
import 'package:easypaisa/Pages/My_Wallet.dart';
import 'package:easypaisa/Pages/Reward.dart';
import 'package:easypaisa/Pages/Upgrade_Account.dart';
import 'package:easypaisa/Pages/sendmoney.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Auth/login.dart';

class HomePageLogin extends StatefulWidget {
  const HomePageLogin({super.key});

  @override
  State<HomePageLogin> createState() => _HomePageLoginState();
}

class _HomePageLoginState extends State<HomePageLogin> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xffebebeb),
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text('easypaisa'),
          leading: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/ep1.jpg'),
                radius: 20,
              ),
            ),

          ),
          actions: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.search)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.notifications_none_rounded)),

          ],
        ),
        body: ListView(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        // MyWallet();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30,bottom: 20,right: 20,left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          width: 400,
                          height: 160,
                          child: Row(
                            children: [
                              SizedBox(width: 15,),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset('assets/images/ep2.png',width: 120,height: 50,),
                                      Text('Avalible Balance'),
                                      const Row(
                                        children: [
                                          Text('Login',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22),),
                                          SizedBox(width: 5,),
                                          CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.black,
                                              foregroundColor: Colors.white,
                                              child: Icon(Icons.arrow_forward,size: 15,)),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.refresh_outlined,size: 15),
                                          SizedBox(width: 5,),
                                          Text('Updated Just Now',style: TextStyle(fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(width: 100),
                              Row(
                                children: [
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(height: 30,),
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Reward(),));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset('assets/images/ep3.png',height: 30,),
                                            Text('My Rewards',style: TextStyle(fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20,),

                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => UpgradeAccount(),));
                                        },
                                        child: Container(
                                            width: 119,
                                            height: 26,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: Colors.green,
                                              ),

                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Center(child: Text('Upgarde Account',style: TextStyle(fontWeight: FontWeight.w500),)),
                                            )),
                                      ),
                                      SizedBox(height: 10,),

                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddCash(),));
                                        },
                                        child: Container(
                                            width: 119,
                                            height: 26,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                                            child: Center(child: Text('Add Cash',style: TextStyle(color: Colors.white),))),
                                      )
                                    ],

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/sendmoney.png',width: 80,height: 70,),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/billpayment.png',width: 80,height: 70,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/mobilepckages.png',width: 80,height: 70,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                      margin: EdgeInsets.only(right: 250),
                      child: Text('More with easypaisa',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),)),
                  SizedBox(height: 30,),

                  Container(
                    width: 380,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),

                    margin: const EdgeInsets.only(left: 0),
                    child: ListView(

                      scrollDirection: Axis.horizontal,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/easyload.png',width: 80,height: 70,),
                                    Image.asset('assets/images/easyloan.png',width: 85,height: 80,),
                                    Image.asset('assets/images/tohfa.png',width: 80,height: 66,),
                                    Image.asset('assets/images/invite.png',width: 80,height: 65,),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset('assets/images/rast.png',width: 90,height: 80,),
                                    Image.asset('assets/images/miniapp.png',width: 80,height: 70,),
                                    Image.asset('assets/images/savings.png',width: 80,height: 75,),
                                    Image.asset('assets/images/buynow.png',width: 80,height: 80,),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset('assets/images/insurance.png',width: 80,height: 70,),
                                    Image.asset('assets/images/donation.png',width: 80,height: 70,),
                                    Image.asset('assets/images/rs1.png',width: 80,height: 70,),
                                    Image.asset('assets/images/more.png',width: 80,height: 65,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/images/easyload.png',width: 80,height: 70,),
                                    Image.asset('assets/images/easyloan.png',width: 85,height: 80,),
                                    Image.asset('assets/images/tohfa.png',width: 80,height: 66,),
                                    Image.asset('assets/images/invite.png',width: 80,height: 65,),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Image.asset('assets/images/rast.png',width: 90,height: 80,),
                                    Image.asset('assets/images/miniapp.png',width: 80,height: 70,),
                                    Image.asset('assets/images/savings.png',width: 80,height: 75,),
                                    Image.asset('assets/images/buynow.png',width: 80,height: 80,),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(

                                  children: [
                                    Image.asset('assets/images/insurance.png',width: 80,height: 70,),
                                    Image.asset('assets/images/donation.png',width: 80,height: 70,),
                                    Image.asset('assets/images/rs1.png',width: 80,height: 70,),
                                    Image.asset('assets/images/more.png',width: 80,height: 65,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],//
                    ),
                  )

                ],
              ),
            ]
        ), bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home,color: Colors.green,),
                        Text('Home',style: TextStyle(color: Colors.green),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.green,),
                        Text('Cash Point',style: TextStyle(color: Colors.green),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_scanner_rounded,color: Colors.green,size: 30,),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.campaign_outlined,color: Colors.green,size: 30,),
                        Text('Promotions',style: TextStyle(color: Colors.green,fontSize: 13),),
                      ],
                    ),

                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed:() {
                      setState(() {

                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person,color: Colors.green,),
                        Text('Account',style: TextStyle(color: Colors.green),),
                      ],
                    ),

                  ),
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
