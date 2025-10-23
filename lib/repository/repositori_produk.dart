import 'package:flutter/foundation.dart';
import '../models/produk.dart';

class RepositoriProduk {
  RepositoriProduk._konstruktorPrivat();
  static final RepositoriProduk instance = RepositoriProduk._konstruktorPrivat();

  final ValueNotifier<List<Produk>> daftarProduk = ValueNotifier<List<Produk>>([
    Produk(id: DateTime.now().millisecondsSinceEpoch.toString(), nama: 'Contoh Produk A', deskripsi: 'Deskripsi produk A yang bagus', harga: 10000),
    Produk(id: (DateTime.now().millisecondsSinceEpoch + 1).toString(), nama: 'Contoh Produk B', deskripsi: 'Deskripsi produk B yang mantap', harga: 20000),
  ]);

  void tambah(Produk p) {
    daftarProduk.value = [...daftarProduk.value, p];
  }

  Produk? cariById(String id) {
    for (final p in daftarProduk.value) {
      if (p.id == id) return p;
    }
    return null;
  }
}