import 'package:flutter/material.dart';

class ArScreen extends StatelessWidget {
  const ArScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR')),
      body: const Center(
        child: Text(
          'Halaman AR',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
