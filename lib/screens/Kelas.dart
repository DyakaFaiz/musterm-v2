import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const Text(
                        'Ayo belajar bersama',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF11668d),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Semangatt!!...',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF11668d),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const SkeletalPartCard(
                        title: 'Part 1: Tulang Tengkorak',
                        imagePath: 'assets/img/skull.png',
                      ),
                      const SizedBox(height: 16),
                      const SkeletalPartCard(
                        title: 'Part 2: Tulang Rusuk',
                        imagePath: 'assets/img/ribcage.png',
                      ),
                      const SizedBox(height: 16),
                      const SkeletalPartCard(
                        title: 'Part 3: Tulang ...',
                        imagePath: 'assets/img/shoulder.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        )
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
            'Belajar Skeletal',
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

}

class SkeletalPartCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const SkeletalPartCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    style: TextStyle(color: Color(0xFF7d848d)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11668d),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Belajar Sekarang',
                      style: TextStyle(color: Colors.white), // Warna teks diubah menjadi putih
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}