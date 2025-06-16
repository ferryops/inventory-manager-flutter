import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import 'add_item_screen.dart';
import '../theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> items = [];

  Future<void> fetchItems() async {
    items = await DBHelper.getItems();
    setState(() {});
  }

  Future<void> deleteItem(int id) async {
    await DBHelper.deleteItem(id);
    fetchItems();
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  void editItem(Map<String, dynamic> item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddItemScreen(item: item), // kirim item
      ),
    );
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventaris'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchItems,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item['id'].toString()),
              background: Container(color: Colors.red),
              onDismissed: (direction) {
                deleteItem(item['id']);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item dihapus')),
                );
              },
              child: GestureDetector(
                onTap: () => editItem(item),
                child: ListTile(
                  title: Text(item['name']),
                  subtitle: Text('Jumlah: ${item['quantity']}'),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddItemScreen()));
          fetchItems();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
