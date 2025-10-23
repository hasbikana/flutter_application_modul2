import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductRepository {
  ProductRepository._privateConstructor();
  static final ProductRepository instance = ProductRepository._privateConstructor();

  final ValueNotifier<List<Product>> products = ValueNotifier<List<Product>>([
    Product(id: DateTime.now().millisecondsSinceEpoch.toString(), name: 'Contoh Produk A', description: 'Deskripsi A', price: 10000),
    Product(id: (DateTime.now().millisecondsSinceEpoch + 1).toString(), name: 'Contoh Produk B', description: 'Deskripsi B', price: 20000),
  ]);

  void add(Product p) {
    products.value = [...products.value, p];
  }

  Product? findById(String id) {
    for (final p in products.value) {
      if (p.id == id) return p;
    }
    return null;
  }
}
