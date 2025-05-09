import 'package:flutter/material.dart';
import 'singlesell_form.dart';
import 'groupsell_form.dart';
import 'want_to_buy_form.dart';
import '../../widgets/title_bar.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TitleBar(title: '거래하기', isIcon: false),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTabButton('단독판매', 0),
                  const SizedBox(width: 20),
                  _buildTabButton('공동판매', 1),
                  const SizedBox(width: 20),
                  _buildTabButton('구하기', 2),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: _selectedIndex == 0 ? SingleSellForm() 
                : _selectedIndex == 1 ? GroupSellForm() : WantToBuyForm(),
              ),
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
