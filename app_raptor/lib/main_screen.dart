import 'package:app_raptor/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_raptor/home_page.dart';
import 'package:app_raptor/search_page.dart';
import 'package:app_raptor/favoritesPage.dart';
import 'package:app_raptor/account_page.dart';

class MainScreen extends StatefulWidget {
  final int startIndex;
  const MainScreen({super.key, this.startIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.startIndex;
  }

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    EntrarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
      ),
    );
  }
}
