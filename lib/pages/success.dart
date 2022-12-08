import 'package:final_project_kel_4/pages/category_admin.dart';
import 'package:final_project_kel_4/components/default_button.dart';
import 'package:final_project_kel_4/widgets/empty_section.dart';
import 'package:final_project_kel_4/widgets/subtitle.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          const SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          DefaultButton(
            btnText: 'Ok',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CategoryAdmin(0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
