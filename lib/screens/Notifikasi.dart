import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustermv2/screens/Home.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAFD),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildNotificationList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=> HomeScreen()), 
                (route) => false,
                );
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF11668D),
              size: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Notifikasi',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF11668D),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24), // For balance
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionHeader('Prioritas'),
            const SizedBox(height: 16),
            _buildPriorityNotification(
              title: 'Kelas Gratis!!!',
              message: 'Wow, ada konsuktasi gratis untuk pengguna baru DevKes',
              date: '01 Juni',
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Inbox'),
            const SizedBox(height: 16),
            _buildInboxNotification(
              title: 'Dapatkan jaminan harga termurah untuk pesananmu',
              message: 'Gunakan voucher pengguna baru untuk mendapatkan harga termuarah',
              date: '30 Mei',
            ),
            const Divider(height: 1, color: Color(0xFFE0E0E0)),
            _buildInboxNotification(
              title: 'Akses belajar kapan saja dan dimana saja dengan aplikasi DevKes',
              message: 'Gunakan voucher pengguna baru untuk mendapatkan harga termuarah',
              date: '30 Mei',
            ),
            const Divider(height: 1, color: Color(0xFFE0E0E0)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          color: const Color(0xFF11668D),
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPriorityNotification({
    required String title,
    required String message,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(top: 4, right: 12),
              decoration: const BoxDecoration(
                color: Color(0xFF11668D),
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              date,
              style: GoogleFonts.nunito(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInboxNotification({
    required String title,
    required String message,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(top: 4, right: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF11668D),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: GoogleFonts.nunito(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}