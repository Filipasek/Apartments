import 'package:apartments/screens/pages/page_one.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.liquor_rounded),
            title: Text('Imprezy'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            title: Text('Zakupy'),
            activeColor: Colors.black,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.assistant),
              title: Text('Główna'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.checklist_rounded),
              title: Text(
                'To-Do',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.manage_accounts_rounded),
              title: Text('Ustawienia'),
              activeColor: Colors.blue),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 251, 254, 247),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 251, 254, 247),
        title: Text(
          'F&S Apartments',
          style: GoogleFonts.comfortaa(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 66, 73, 65),
              fontWeight: FontWeight.w800,
              fontSize: 24.0,
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            PageOne(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            PageOne(),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
