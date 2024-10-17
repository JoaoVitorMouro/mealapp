import 'package:flutter/material.dart';
import 'package:unimar_app_pos/views/favorite_screen.dart';
import 'package:unimar_app_pos/views/products_screen.dart';
import 'package:unimar_app_pos/views/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Controller para navegar entre páginas
final PageController pageController = PageController();
int currentPage = 0;

class _HomePageState extends State<HomePage> {
  void onTap(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2B32), // Fundo cinza escuro
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          ProductsScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            const Color(0xFF2A2B32), // Fundo cinza escuro do BottomNav
        elevation: 5,
        onTap: onTap,
        currentIndex: currentPage,
        selectedItemColor: Colors.white, // Cor do ícone selecionado
        unselectedItemColor: Colors.grey, // Cor dos ícones não selecionados
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
