import 'package:flutter/material.dart';
import '../../widgets/title_bar.dart';
import 'ontrading_screen.dart';
import 'endtrading_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TitleBar(title: '거래상황'),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTabButton('거래중', 0),
                  const SizedBox(width: 20),
                  _buildTabButton('거래완료', 1),
                ],
              ),
            ),
            Flexible(
              child: _selectedIndex == 0 
                ? OnTradingScreen()
                : EndTradingScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? const Color(0xFF6562DF) : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          /* Container(
            height: 2,
            width: 60,
            color: isSelected ? const Color(0xFF6562DF) : Colors.transparent,
          ), */
          //밑줄 넣는게 나을까 안 넣는게 나을까?
        ],
      ),
    );
  }
}
