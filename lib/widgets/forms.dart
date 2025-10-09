import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hello, $_name')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (v) => (v == null || v.isEmpty) ? 'Masukkan nama' : null,
                onSaved: (v) => _name = v ?? '',
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _submit, child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

