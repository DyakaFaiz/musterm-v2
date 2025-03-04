import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustermv2/screens/Notifikasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Skeletal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF11668D),
        scaffoldBackgroundColor: const Color(0xFFF1FAFD),
        fontFamily: GoogleFonts.nunito().fontFamily,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPromoBanner(),
                    _buildTabBar(),
                    _buildTabContent(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari disini...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          _buildIconWithBadge(Icons.notifications_outlined, 12, context),
          const SizedBox(width: 16),
          _buildIconWithBadge(Icons.bookmark_border, 3, context),
        ],
      ),
    );
  }

  Widget _buildIconWithBadge(IconData icon, int count, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.notifications_outlined) {
          // Jika ikon adalah notifikasi, arahkan ke halaman Notifikasi
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Notifikasi()),
          );
        }
        // Jika bukan ikon notifikasi, tidak melakukan navigasi
      },
      child: Stack(
        children: [
          Icon(icon, size: 28, color: const Color(0xFF11668D)),
          if (count > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1C40F),
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '60% Diskon',
                        style: GoogleFonts.nunito(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF11668D),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '*Untuk 1 bulan pertama',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: const Color(0xFF11668D),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF11668D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            'Langganan',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF11668D),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Character with books image
                    Positioned(
                      right: -10,
                      bottom: 0,
                      top: 0,
                      width: 200,
                      child: Image.asset(
                        'assets/img/promo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    // Credit card image
                    Positioned(
                      top: 40,
                      left: 0,
                      child: Transform.rotate(
                        angle: -0.1, // Slight rotation for better appearance
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1C40F),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 0,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Card details
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.7),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.7),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 6,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Shine effect
                              Positioned(
                                right: -15,
                                top: 15,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.6),
                                        Colors.white.withOpacity(0.0),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              // Card chip
                              Positioned(
                                top: 8,
                                left: 50,
                                child: Container(
                                  width: 16,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Carousel indicators
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF11668D),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Warna background tab bar
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16), // Memberi jarak pada tab
      child: TabBar(
        controller: _tabController,
        indicatorColor: const Color(0xFF11668D),
        indicatorWeight: 4,
        labelColor: const Color(0xFF11668D),
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        tabs: const [
          Tab(text: 'Kelas'),
          Tab(text: 'Diskusi'),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white, // Background putih
    ),
    child: SizedBox(
      height: 800, // Fixed height for the tab content
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildClassContent(),
          Center(child: Text('Diskusi Content')),
        ],
      ),
    ),
  );
}

  Widget _buildClassContent() {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: Column(
      children: [
        _buildCourseSection('Belajar Skeletal', [
          CourseItem(
            title: 'Part 1: Tulang Tengkorak',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imageUrl: 'assets/img/skull.png', // Gunakan dari assets
          ),
          CourseItem(
            title: 'Part 2',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imageUrl:
                'assets/img/skull.png',
          ),
        ]),
        const SizedBox(height: 16), // Jarak antar section
        _buildCourseSection('Belajar Muscle', [
          CourseItem(
            title: 'Part 1',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imageUrl:
                'assets/img/skull.png',
          ),
          CourseItem(
            title: 'Part 2',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            imageUrl:
                'assets/img/skull.png',
          ),
        ]),
      ],
    ),
  );
}

  Widget _buildCourseSection(String title, List<CourseItem> items) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    color: const Color(0xFF11668D),
                    margin: const EdgeInsets.only(right: 8),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: const Color(0xFF11668D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildCourseCard(items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(CourseItem item) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF11668D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      'Belajar Sekarang',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseItem {
  final String title;
  final String description;
  final String imageUrl;

  CourseItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}