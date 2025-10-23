import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../repository/repositori_produk.dart';

class HalamanFormulirProduk extends StatefulWidget {
  const HalamanFormulirProduk({super.key});

  @override
  State<HalamanFormulirProduk> createState() => _HalamanFormulirProdukState();
}

class _HalamanFormulirProdukState extends State<HalamanFormulirProduk> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _deskripsi = '';
  double _harga = 0;

  void _simpan() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _formKey.currentState?.save();
    
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final produk = Produk(
      id: id,
      nama: _nama,
      deskripsi: _deskripsi,
      harga: _harga
    );
    
    RepositoriProduk.instance.tambah(produk);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                validator: (v) => (v == null || v.isEmpty) ? 'Masukkan nama produk' : null,
                onSaved: (v) => _nama = v ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (v) => (v == null || v.isEmpty) ? 'Masukkan harga produk' : null,
                onSaved: (v) => _harga = double.tryParse(v ?? '0') ?? 0,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                maxLines: 3,
                onSaved: (v) => _deskripsi = v ?? '',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _simpan,
                child: const Text('Simpan Produk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}