import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repository/product_repository.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _description = '';
  double _price = 0;

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _formKey.currentState?.save();
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final p = Product(id: id, name: _name, description: _description, price: _price);
    ProductRepository.instance.add(p);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                validator: (v) => (v == null || v.isEmpty) ? 'Masukkan nama' : null,
                onSaved: (v) => _name = v ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Masukkan harga' : null,
                onSaved: (v) => _price = double.tryParse(v ?? '0') ?? 0,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                onSaved: (v) => _description = v ?? '',
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _save, child: const Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}
