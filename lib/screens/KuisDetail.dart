import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KuisdetailScreen extends StatefulWidget {
  const KuisdetailScreen({super.key});

  @override
  _KuisdetailScreenState createState() => _KuisdetailScreenState();
}

class _KuisdetailScreenState extends State<KuisdetailScreen> {
  int selectedOption = 2; // Option C is selected (0-based index)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAFD),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildProgressBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildQuestion(),
                      const SizedBox(height: 20),
                      _buildOptions(),
                    ],
                  ),
                ),
              ),
            ),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                'Part 1: Tulang Tengkorak',
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF11668D),
                ),
              ),
            ),
          ),
          const SizedBox(width: 24), // Untuk keseimbangan
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Terjawab 6 dari 15 soal',
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: const Color(0xFF11668D),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 6 / 15,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF11668D)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '6. ',
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla convallis egestas rhoncus.',
            style: GoogleFonts.nunito(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    final options = [
      'a. Lorem',
      'b. Ipsum',
      'c. Dolor',
      'd. Sit amet',
    ];

    return Column(
      children: List.generate(
        options.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: index == selectedOption
                  ? Border.all(color: const Color(0xFF11668D), width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      options[index],
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: index == selectedOption ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Handle previous button press
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF11668D),
                side: const BorderSide(color: Color(0xFF11668D)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Sebelumnya',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle next button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF11668D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Selanjutnya',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}