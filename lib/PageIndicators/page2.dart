import 'package:flutter/material.dart';
class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/easyload.png',
                    width: 80,
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/easyloan.png',
                    width: 85,
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/tohfa.png',
                    width: 80,
                    height: 66,
                  ),
                  Image.asset(
                    'assets/images/invite.png',
                    width: 80,
                    height: 65,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/images/rast.png',
                    width: 90,
                    height: 80,
                  ),
                  Image.asset(
                    'assets/images/miniapp.png',
                    width: 80,
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/savings.png',
                    width: 80,
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/buynow.png',
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/images/insurance.png',
                    width: 80,
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/donation.png',
                    width: 80,
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/rs1.png',
                    width: 80,
                    height: 70,
                  ),
                  Image.asset(
                    'assets/images/more.png',
                    width: 80,
                    height: 65,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
