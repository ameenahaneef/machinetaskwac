import 'package:flutter/material.dart';
import 'package:machinetask_wac/viewmodels/bottom_nav_provider.dart';
import 'package:machinetask_wac/views/home/pages/home_content.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const HomeContent(),
      const Center(child: Text('Category')),
      const Center(child: Text('Cart')),
      const Center(child: Text('Offers')),
      const Center(child: Text('Account')),
    ];

    return Scaffold(
      body: Consumer<BottomNavProvider>(
        builder: (context, provider, child) {
          return _pages[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.updateIndex(index);
            },
            backgroundColor: Colors.grey[800],
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.home, provider.currentIndex == 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.category, provider.currentIndex == 1),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.shop, provider.currentIndex == 2),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.local_offer, provider.currentIndex == 3),
                label: 'Offers',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(Icons.person, provider.currentIndex == 4),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
      ),
    );
  }
}
