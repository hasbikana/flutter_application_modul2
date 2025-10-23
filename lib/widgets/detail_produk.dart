import 'package:flutter/material.dart';
import '../repository/repositori_produk.dart';

class HalamanDetailProduk extends StatelessWidget {
  final String idProduk;
  const HalamanDetailProduk({super.key, required this.idProduk});

  @override
  Widget build(BuildContext context) {
    final repo = RepositoriProduk.instance;
    final produk = repo.cariById(idProduk);

    if (produk == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Produk')),
        body: const Center(child: Text('Produk tidak ditemukan')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(produk.nama, 
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 8),
            Text('Harga: Rp ${produk.harga.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18)
            ),
            const SizedBox(height: 12),
            Text(produk.deskripsi),
          ],
        ),
      ),
    );
  }
}