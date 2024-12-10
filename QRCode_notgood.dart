import 'package:flutter/material.dart';
import 'qr_render_page.dart';
import 'qr_scanner_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.light(useMaterial3: false),
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('QR Code')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [btnRenderQr(), SizedBox(height: 15), btnScanQr()],
      )));

  Widget btnRenderQr() => ElevatedButton(
        child: Text('สร้าง QR Code', style: TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QrRenderPage()),
          );
        },
      );

  Widget btnScanQr() => ElevatedButton(
        child: Text('สแกน QR Code', style: TextStyle(fontSize: 20)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QrScannerPage()),
          ).then((value) {
            if (value != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$value'),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          });
        },
      );
}
