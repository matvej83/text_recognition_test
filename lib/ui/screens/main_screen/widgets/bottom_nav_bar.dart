import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.currentPage, required this.onItemTap});

  final int currentPage;
  final Function(int index) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentPage,
      onTap: onItemTap,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Recognise Text'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Scan Card'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card_sharp), label: 'Scan Card alt.'),
      ],
    );
  }
}
