import 'package:flutter/material.dart';

class KuisScreen extends StatelessWidget {
  const KuisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kuis')),
      body: const Center(
        child: Text(
          'Halaman Kuis',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
