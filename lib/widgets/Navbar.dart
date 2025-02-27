import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) 
  {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Color(0xFF11668D), // Warna ungu kebiruan
      unselectedItemColor: Colors.grey, // Warna ikon tidak aktif
      backgroundColor: Colors.white, // Warna latar belakang navbar
      type: BottomNavigationBarType.fixed, // Mencegah ikon bergeser saat dipilih
      selectedLabelStyle: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home_svgrepo.com.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              selectedIndex == 0 ? Color(0xFF11668D) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Beranda',
        ), 
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/books-svgrepo-com.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1 ? Color(0xFF11668D) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Kelas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.extension),
          label: 'AR',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/icon-kuis.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3 ? Color(0xFF11668D) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Kuis',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/icon-profile.svg',
            width: 30,
            height: 30,
            colorFilter: ColorFilter.mode(
              selectedIndex == 4 ? Color(0xFF11668D) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
