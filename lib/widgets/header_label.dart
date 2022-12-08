import 'package:flutter/material.dart';

class HeaderLabel extends StatelessWidget {
  final String headerText;
  const HeaderLabel({
    Key? key,
    required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        headerText,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 28.0),
      ),
    );
  }
}
