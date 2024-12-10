import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มสินค้า',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 129, 131, 130),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 224, 226, 226)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 60,
                    color: Colors.teal.shade300,
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: 'ชื่อสินค้า',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
                  border: InputBorder.none,
                ),
              ),
              Divider(
                  color: const Color.fromARGB(255, 143, 141, 141),
                  thickness: 1),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'จำนวนคงเหลือ',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
                  prefixIcon: Icon(Icons.attach_money, color: Colors.teal),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
              ),
              Divider(
                  color: const Color.fromARGB(255, 143, 141, 141),
                  thickness: 1),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'ประเภทสินค้า',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
                  border: InputBorder.none,
                ),
                items: ['สินค้า', 'บริการ']
                    .map(
                      (value) => DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),
              Divider(
                  color: const Color.fromARGB(255, 143, 141, 141),
                  thickness: 1),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'รายละเอียดสินค้า',
                  labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
                  border: InputBorder.none,
                ),
                maxLines: 3,
              ),
              Divider(
                  color: const Color.fromARGB(255, 143, 141, 141),
                  thickness: 1),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Add your action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(Icons.save),
                  label: Text(
                    'บันทึก',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
