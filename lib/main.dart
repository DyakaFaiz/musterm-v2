import 'package:flutter/material.dart';
import 'screens/Home.dart';
import 'screens/Ar.dart';
import 'screens/Kelas.dart';
import 'screens/Profile.dart';
import 'screens/Kuis.dart';
import 'Register.dart';
import 'widgets/Navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musterm V2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthCheckScreen(), // Menentukan apakah user masuk ke Register atau Home
    );
  }
}

// Gunakan variabel loginStatus untuk menentukan apakah user sudah login atau belum
class AuthCheckScreen extends StatelessWidget {
  const AuthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false; // Ubah menjadi `true` jika user sudah login

    return isLoggedIn
    ? MainScreen(userName: '', userEmail: '')
    : const Register();

  }
}

// MainScreen untuk navigasi jika user sudah login
class MainScreen extends StatefulWidget {
  final String userName;
  final String userEmail;

  const MainScreen({super.key, required this.userName, required this.userEmail});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Mulai dari HomeScreen

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomeScreen(),
      const KelasScreen(),
      const ArScreen(),
      const KuisScreen(),
      ProfileScreen(
        userName: widget.userName,
        userEmail: widget.userEmail,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}