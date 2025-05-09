import 'package:flutter/material.dart';
import '../../widgets/title_bar.dart';


class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: '마이페이지', isIcon: false),
    );  
  }
}
