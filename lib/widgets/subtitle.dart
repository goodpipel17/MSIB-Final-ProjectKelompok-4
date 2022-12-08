import 'package:final_project_kel_4/themes.dart';
import 'package:flutter/material.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: kSubTextStyle,
      ),
    );
  }
}
