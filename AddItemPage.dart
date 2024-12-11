import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  // ตัวแปรเพื่อเก็บข้อมูลที่กรอก
  final TextEditingController itemCodeController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController storageLocationController =
      TextEditingController();
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController receivingDateController = TextEditingController();
  final TextEditingController stockStatusController = TextEditingController();

  DateTime? expirationDate;

  // ฟังก์ชันที่ใช้ในการคำนวณมูลค่าคงคลัง
  double get inventoryValue {
    final quantity = double.tryParse(quantityController.text) ?? 0;
    final unitPrice = double.tryParse(unitPriceController.text) ?? 0;
    return quantity * unitPrice;
  }

  // ฟังก์ชันเพื่อบันทึกข้อมูล
  void _saveItem() {
    final itemCode = itemCodeController.text;
    final itemName = itemNameController.text;
    final description = descriptionController.text;
    final unit = unitController.text;
    final quantity = quantityController.text;
    final unitPrice = unitPriceController.text;
    final storageLocation = storageLocationController.text;
    final supplier = supplierController.text;
    final stockStatus = stockStatusController.text;

    if (itemCode.isEmpty ||
        itemName.isEmpty ||
        description.isEmpty ||
        unit.isEmpty ||
        quantity.isEmpty ||
        unitPrice.isEmpty ||
        storageLocation.isEmpty ||
        supplier.isEmpty ||
        stockStatus.isEmpty ||
        expirationDate == null) {
      // แสดงข้อความเตือนหากมีช่องกรอกที่ว่าง
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ข้อมูลไม่สมบูรณ์'),
            content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('ปิด'),
              ),
            ],
          );
        },
      );
      return;
    }

    // เพิ่มฟังก์ชันในการบันทึกข้อมูลที่นี่ (เช่นการส่งข้อมูลไปยังฐานข้อมูล)
    print(
        'บันทึก: รหัสสินค้า: $itemCode, ชื่อสินค้า: $itemName, รายละเอียด: $description, หน่วย: $unit');
    print(
        'ปริมาณคงเหลือ: $quantity, ราคาต่อหน่วย: $unitPrice, มูลค่าคงคลัง: ${inventoryValue.toStringAsFixed(2)}');
    print(
        'สถานที่จัดเก็บ: $storageLocation, สถานะสินค้า: $stockStatus, วันหมดอายุ: $expirationDate');
    print(
        'ข้อมูลผู้จัดหา: $supplier, วันที่รับสินค้า: ${receivingDateController.text}');

    // ปิดหน้าหลังจากบันทึก
    Navigator.pop(context);
  }

  // ฟังก์ชันเลือกวันหมดอายุ
  Future<void> _selectExpirationDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: expirationDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != expirationDate) {
      setState(() {
        expirationDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เพิ่มสินค้าลงในสต็อก'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: itemCodeController,
                decoration: InputDecoration(
                  labelText: 'รหัสสินค้า (Item Code)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(
                  labelText: 'ชื่อสินค้า (Item Name)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'รายละเอียดสินค้า (Item Description)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: unitController,
                decoration: InputDecoration(
                  labelText: 'หน่วยวัด (Unit of Measurement)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: quantityController,
                decoration: InputDecoration(
                  labelText: 'ปริมาณคงเหลือ (Stock Quantity)',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    TextInputType.number, // ใช้ตัวเลือกนี้สำหรับกรอกตัวเลข
              ),
              SizedBox(height: 16),
              TextField(
                controller: unitPriceController,
                decoration: InputDecoration(
                  labelText: 'ราคาต่อหน่วย (Unit Price)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // สำหรับกรอกราคา
              ),
              SizedBox(height: 16),
              TextField(
                controller: storageLocationController,
                decoration: InputDecoration(
                  labelText: 'สถานที่จัดเก็บ (Storage Location)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: supplierController,
                decoration: InputDecoration(
                  labelText: 'ข้อมูลผู้จัดหา (Supplier Information)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: receivingDateController,
                decoration: InputDecoration(
                  labelText: 'วันที่รับสินค้า (Receiving Date)',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null && pickedDate != DateTime.now()) {
                    setState(() {
                      receivingDateController.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('วันหมดอายุ (Expiration Date):'),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () => _selectExpirationDate(context),
                    child: Text(expirationDate == null
                        ? 'เลือกวันหมดอายุ'
                        : expirationDate!.toLocal().toString().split(' ')[0]),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: stockStatusController,
                decoration: InputDecoration(
                  labelText: 'สถานะสินค้า (Stock Status)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                  'มูลค่าคงคลัง (Inventory Value): ${inventoryValue.toStringAsFixed(2)}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveItem, // เรียกใช้ฟังก์ชันเมื่อกดปุ่ม
                child: Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
