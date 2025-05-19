import 'package:flutter/material.dart';
import '../../widgets/title_bar.dart';
//import '../../dummy_data/items.dart';


class EndTradingScreen extends StatelessWidget {
  final String currentUserId = 'u01'; // 현재 로그인한 사용자 ID

  const EndTradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text('hello'),
    );
  }
}
