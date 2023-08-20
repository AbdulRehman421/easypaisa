// import 'package:flutter/material.dart';
//
//
// class QrScanner extends StatefulWidget {
//   const QrScanner({super.key});
//
//   @override
//   State<QrScanner> createState() => _QrScannerState();
// }
//
// class _QrScannerState extends State<QrScanner> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Qr Scanner',style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold),),
//         backgroundColor: Colors.white,
//       ),
//     );
//   }
// }



////////////////////////////////////////////////////////////////////////////////


import 'dart:developer';
import 'dart:io';

import 'package:easypaisa/HomePage.dart';
import 'package:easypaisa/Pages/sendmoney.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QrScanner(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {
          HomePage();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.green,)),
        backgroundColor: Colors.green,elevation: 0,title: Text('Scan QR to send Money',style: TextStyle(color: Colors.white),),),
      body: Column(
        children: <Widget>[
          // Expanded(flex: 1,
          //     child: Text('Scan QR to send Money')),
          Expanded(flex: 6, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // if (result != null)
                  //
                  //   Text(
                  //       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  //
                  //
                  // else
                  //   const Text('Scan a code'),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return IconButton(
                                  onPressed: () async {
                                    await controller?.toggleFlash();
                                    setState(() {});
                                  },
                                icon:  Icon(Icons.flash_on_sharp,color: Colors.green),
                                  );
                              // return Text('Flash: ${snapshot.data}');
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                return IconButton(onPressed : () async {
                                  await controller?.flipCamera();
                              setState(() {});
                              }, icon: Icon(Icons.camera_enhance_rounded,color: Colors.green,));
                                // return Text(
                                //     'Rotate Camera ${describeEnum(snapshot.data!)}');
                              } else {
                                return const Text('loading');
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),

            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoney(results: result!.code),));

      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}