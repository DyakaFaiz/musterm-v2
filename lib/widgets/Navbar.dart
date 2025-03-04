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
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, -5),
                ),
              ],
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SafeArea(
              top: false,
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: onItemTapped,
                selectedItemColor: Color(0xFF11668D),
                unselectedItemColor: Color(0xFF7D848D),
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
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
                        selectedIndex == 0 ? Color(0xFF11668D) : Color(0xFF7D848D),
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
                        selectedIndex == 1 ? Color(0xFF11668D) : Color(0xFF7D848D),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Kelas',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/icon-kuis.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        selectedIndex == 3 ? Color(0xFF11668D) : Color(0xFF7D848D),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Kuis',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/icon-profile.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        selectedIndex == 4 ? Color(0xFF11668D) : Color(0xFF7D848D),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () => onItemTapped(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF11668D),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF11668D).withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "AR",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}