import 'package:flutter/material.dart';

void main() => runApp(App05BottomBar());

class App05BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.light(useMaterial3: false).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _buildImageLayout(context),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMenu(context);
          },
          child: Icon(Icons.qr_code_scanner, color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.green,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      );

  // ฟังก์ชันสำหรับแสดงรูปภาพทั้งหมด
  Widget _buildImageLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the column
      crossAxisAlignment:
          CrossAxisAlignment.center, // Center align the content horizontally
      children: [
        _buildImageWithBox(context), // The first image in the center
        SizedBox(height: 16), // Space between the first and the next images
        _buildImageGrid(context), // The 4 images below
      ],
    );
  }

  // ฟังก์ชันสำหรับแสดงกล่องที่มีภาพ
  Widget _buildImageWithBox(BuildContext context) {
    return Container(
      alignment: Alignment.center, // Align the box in the center of the screen
      padding: EdgeInsets.all(16), // Add padding around the box
      child: Container(
        width: 300, // Set the width of the box
        height: 200, // Set the height of the box
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // Optional: rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(12), // Match border radius of container
          child: Image.asset(
            'Images/NongNINE.jpg',
            fit: BoxFit.cover, // Ensures the image fits within the box
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับแสดงกริดของภาพ 4 กล่อง
  Widget _buildImageGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Prevents GridView from taking unnecessary space
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns in the grid
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
      ),
      itemCount: 4, // 4 items in total
      itemBuilder: (context, index) {
        String description = 'ภาพที่ ${index + 1}';
        return _buildSquareImageWithDescription(
          context,
          'Images/NongNINE.jpg', // Image path
          description,
          width: 160,
          height: 110,
        );
      },
    );
  }

  // ฟังก์ชันสร้างรูปภาพที่มีคำบรรยาย
  Widget _buildSquareImageWithDescription(
      BuildContext context, String imagePath, String description,
      {double width = 100.0, double height = 100.0}) {
    return Column(
      children: [
        Image.asset(imagePath, width: width, height: height, fit: BoxFit.cover),
        SizedBox(height: 8),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }

  // ฟังก์ชันแสดง BottomSheet
  void _showMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.qr_code_scanner, size: 40),
                      color: Color.fromARGB(255, 0, 0, 0),
                      onPressed: () {
                        Navigator.pop(context); // ปิด Modal Bottom Sheet
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddItemPage()),
                        );
                      },
                    ),
                    Text('เพิ่มสิ่งของ'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddItemPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เพิ่มสิ่งของ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'ชื่อสิ่งของ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'รายละเอียด',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // เพิ่มฟังก์ชันบันทึกข้อมูลที่นี่
                String name = nameController.text;
                String description = descriptionController.text;
                if (name.isNotEmpty && description.isNotEmpty) {
                  // ทำอะไรกับข้อมูลที่กรอก
                  print('ชื่อสิ่งของ: $name, รายละเอียด: $description');
                  Navigator.pop(context); // ปิดหน้าหลังจากบันทึกสำเร็จ
                }
              },
              child: Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}
