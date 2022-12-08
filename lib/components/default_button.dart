import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  const DefaultButton({
    Key? key,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: const Color(0xFFFFA45B),
        ),
        child: Text(
          btnText.toUpperCase(),
          style: const TextStyle(
              color: Colors.white, backgroundColor: Colors.transparent),
        ),
      ),
    );
  }
}
