import 'package:flutter/material.dart';

class LayoutsPage extends StatelessWidget {
  const LayoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('contoh Column & Row ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('contoh column', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Container(
              color: Colors.blue.shade50,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: const [
                  Text('Item 1'),
                  Text('Item 2'),
                  Text('Item 3'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('contoh row', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Container(
              color: Colors.green.shade50,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.star, color: Colors.orange),
                  Text('item row'),
                  Icon(Icons.star, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
