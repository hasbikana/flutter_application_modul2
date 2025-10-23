import 'package:flutter/material.dart';
import '../models/product.dart';
import '../repository/product_repository.dart';
import 'product_detail.dart';
import 'product_form.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ProductRepository.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: repo.products,
        builder: (context, products, _) {
          if (products.isEmpty) return const Center(child: Text('Belum ada produk'));
          return ListView.separated(
            itemCount: products.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) {
              final p = products[i];
              return ListTile(
                title: Text(p.name),
                subtitle: Text('Rp ${p.price.toStringAsFixed(0)}'),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductDetailPage(productId: p.id))),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProductFormPage())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
