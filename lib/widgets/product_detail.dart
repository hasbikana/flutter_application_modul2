import 'package:flutter/material.dart';
import '../repository/product_repository.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final repo = ProductRepository.instance;
    final product = repo.findById(productId);

    if (product == null) {
      return Scaffold(appBar: AppBar(title: const Text('Detail Produk')), body: const Center(child: Text('Produk tidak ditemukan')));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Harga: Rp ${product.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
