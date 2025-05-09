import 'package:flutter/material.dart';
import 'home/home_screen.dart';
import 'upload/upload_screen.dart';
import 'transaction/transaction_screen.dart';
import 'mypage/mypage_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    UploadScreen(),
    TransactionScreen(),
    MyPageScreen(),
  ];

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: _screens[_currentIndex],
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            offset: const Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: const Color(0xFF6562DF),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 5,
        iconSize: 26,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(height: 10),
                Icon(Icons.home),
                SizedBox(height: 40),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(height: 10),
                Icon(Icons.add_box_outlined),
                SizedBox(height: 40),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(height: 10),
                Icon(Icons.swap_horiz),
                SizedBox(height: 40),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SizedBox(height: 10),
                Icon(Icons.person),
                SizedBox(height: 40),
              ],
            ),
            label: '',
          ),
        ],
      ),
    ),
  );
}

}
