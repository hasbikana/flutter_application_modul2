import 'package:flutter/material.dart';
import 'widgets/hello_world.dart';
import 'widgets/layouts.dart';
import 'widgets/stateless_stateful.dart';
import 'widgets/forms.dart';
import 'widgets/helpers.dart';
import 'widgets/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modul Examples',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tugas modul 1 - Flutter Mohamad Hasbi Kana _ STI202303728')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('Produk (ListView & Detail)'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProductListPage())),
          ),
          ListTile(
            title: const Text('Hello World'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HelloWorldPage())),
          ),
          ListTile(
            title: const Text('Column & Row (Layouts)'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LayoutsPage())),
          ),
          ListTile(
            title: const Text('Stateless & Stateful'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StatelessExample())),
          ),
          ListTile(
            title: const Text('Stateful Counter'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StatefulExample())),
          ),
          ListTile(
            title: const Text('Cotoh Forms'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FormsPage())),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: buildLabel('Pemecahan Widget ke dalam fungsi'),
          ),
          buildButton(() { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('tertekan'))); }, 'tekan'),
        ],
      ),
    );
  }
}
