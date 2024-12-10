import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Import the package to render QR code

class QrRenderPage extends StatelessWidget {
  @override
  State<QrRenderPage> createState() => QrRenderPageState();
}

class QrRenderPageState extends State<QrRenderPage> {
  var textCtrl = TextEditingController();
  var _QrCode = 'Hello';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Render QRCode')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField for entering QR code data
              SizedBox(
                width: 300,
                child: TextField(
                  controller: textCtrl,
                  decoration: InputDecoration(
                    hintText: 'Enter QR Code data',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Button to generate QR code
              ElevatedButton(
                child: Text('สร้าง QR Code', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  setState(() {
                    _QrCode = textCtrl.text.isEmpty
                        ? 'Enter text to generate QR'
                        : textCtrl.text; // Check if text is empty
                  });
                },
              ),
              SizedBox(height: 30),
              // Display QR code using the qr_flutter package
              QrImageView(
                data: _QrCode, // Use _QrCode to generate the QR code
                size: 240,
              ),
              SizedBox(height: 20),
              // Clear Button
              ElevatedButton(
                child: Text('Clear', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  setState(() {
                    textCtrl.clear(); // Clear the text field
                    _QrCode = 'Hello'; // Reset the QR code
                  });
                },
              ),
            ],
          ),
        ),
      );
}
