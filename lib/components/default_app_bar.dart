import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key? key,
    required this.title,
    required this.child,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const TextStyle(color: Color(0xFFFFA45B))),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: Color(0xFFFFA45B)),
      leading: child,
      actions: action,
    );
  }
}
