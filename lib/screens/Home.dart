import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0, // Hilangkan bayangan AppBar
      backgroundColor: Colors.transparent, // Membuat AppBar transparan
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Membuat status bar juga transparan
        statusBarIconBrightness: Brightness.dark, // Ubah ikon status bar agar tetap terlihat
      ),
      title: Row(
        children: [
          // Search Field dengan background putih
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari...',
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white, // Warna putih untuk search bar
              ),
            ),
          ),
          SizedBox(width: 10), // Jarak antar ikon
          // Notifikasi Icon
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Aksi Notifikasi
            },
          ),
          // Simpan Icon
          IconButton(
            icon: Icon(Icons.save, color: Colors.black),
            onPressed: () {
              // Aksi Simpan
            },
          ),
        ],
      ),
    ),
      extendBodyBehindAppBar: true, // Agar konten naik ke belakang AppBar
      body: Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF1FAFD), // Warna background diubah ke F1FAFD
      ),
      child: const Center(
        child: Text(
          'Halaman Home',
          style: TextStyle(fontSize: 20, color: Colors.black), // Ganti warna teks agar terlihat
        ),
      ),
    ),
    );
  }
}