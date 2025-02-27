import 'package:flutter/material.dart';

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kelas')),
      body: const Center(
        child: Text(
          'Halaman Kelas',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
