import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isIcon;

  const TitleBar({super.key, required this.title, this.isIcon = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(left: 5.0, top: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            isIcon
                ? Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.search_outlined),
                      onPressed: () {},
                      iconSize: 35,
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_outlined),
                      onPressed: () {},
                      iconSize: 35,
                    ),
                  ],
                )
                : Row(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Color(0xff6562df),
      surfaceTintColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
