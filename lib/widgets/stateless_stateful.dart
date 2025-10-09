import 'package:flutter/material.dart';

class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatelessWidget')),
      body: const Center(child: Text('Ini StatelessWidget')),
    );
  }

}


class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatefulWidget')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Counter: $_counter', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _increment, child: const Text('Tambah')),
          ],
        ),
      ),
    );
  }
}

