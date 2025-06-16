import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class AddItemScreen extends StatefulWidget {
  final Map<String, dynamic>? item;
  const AddItemScreen({super.key, this.item});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  bool get isEdit => widget.item != null;

  @override
  void initState() {
    super.initState();
    if (isEdit) {
      nameController.text = widget.item!['name'];
      qtyController.text = widget.item!['quantity'].toString();
    }
  }

  void saveOrUpdateItem() async {
    final name = nameController.text;
    final qty = int.tryParse(qtyController.text) ?? 0;

    if (isEdit) {
      await DBHelper.updateItem(widget.item!['id'], name, qty);
    } else {
      await DBHelper.insertItem(name, qty);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Barang' : 'Tambah Barang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nama Barang'),
            ),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Jumlah'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveOrUpdateItem,
              child: Text(isEdit ? 'Update' : 'Simpan'),
            )
          ],
        ),
      ),
    );
  }
}
