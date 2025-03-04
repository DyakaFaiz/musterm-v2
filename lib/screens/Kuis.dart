import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustermv2/screens/KuisDetail.dart';

class KuisScreen extends StatelessWidget {
  const KuisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAFD),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildQuizList(),
            ),
            // Bottom navigation bar is not included as requested
            const SizedBox(height: 80), // Space for the bottom navigation bar
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Handle back button press
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF11668D),
              size: 24,
            ),
          ),
          Text(
            'Kuiz',
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF11668D),
            ),
          ),
          const SizedBox(width: 24), // For balance
        ],
      ),
    );
  }

  Widget _buildQuizList() {
    final quizItems = [
      {
        'part': 'Part 1',
        'title': 'Tulang Tengkorak',
        'questions': '15 Soal',
      },
      {
        'part': 'Part 2',
        'title': 'Tulang Rusuk',
        'questions': '15 Soal',
      },
      {
        'part': 'Part 3',
        'title': 'Tulang ....',
        'questions': '15 Soal',
      },
      {
        'part': 'Part 4',
        'title': 'Tulang ....',
        'questions': '15 Soal',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: quizItems.length,
      itemBuilder: (context, index) {
        final item = quizItems[index];
        return _buildQuizCard(
          context: context,
          part: item['part']!,
          title: item['title']!,
          questions: item['questions']!,
        );
      },
    );
  }

  Widget _buildQuizCard({
    required BuildContext context, // Tambahkan context sebagai parameter
    required String part,
    required String title,
    required String questions,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FDFF),
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
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  part,
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF11668D),
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF11668D),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  questions,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: const Color(0xFF11668D),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KuisdetailScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1C40F), // Warna tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                elevation: 2, // Elevasi tombol agar terlihat lebih baik
              ),
              child: Text(
                'Mulai',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
