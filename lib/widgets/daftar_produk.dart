import 'package:flutter/material.dart';
import '../models/produk.dart';
import '../repository/repositori_produk.dart';
import 'detail_produk.dart';
import 'formulir_produk.dart';

class HalamanDaftarProduk extends StatelessWidget {
  const HalamanDaftarProduk({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = RepositoriProduk.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ValueListenableBuilder<List<Produk>>(
        valueListenable: repo.daftarProduk,
        builder: (context, daftarProduk, _) {
          if (daftarProduk.isEmpty) {
            return const Center(child: Text('Belum ada produk tersedia'));
          }
          return ListView.separated(
            itemCount: daftarProduk.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) {
              final produk = daftarProduk[i];
              return ListTile(
                title: Text(produk.nama),
                subtitle: Text('Rp ${produk.harga.toStringAsFixed(0)}'),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HalamanDetailProduk(idProduk: produk.id)
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const HalamanFormulirProduk())
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}