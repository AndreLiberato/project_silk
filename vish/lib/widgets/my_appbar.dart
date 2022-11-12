import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  MyAppBar({required this.title, this.actions = const []});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            shadows: [Shadow(color: Colors.black26, offset: Offset(1, 3))],
            color: Color(0xFFf65c05),
            fontFamily: "Cherry Bomb",
            fontSize: 24),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.grey, size: 24),
      actions: actions,
    );
  }
}
