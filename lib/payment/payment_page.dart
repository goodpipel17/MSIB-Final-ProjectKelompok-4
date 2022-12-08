import 'package:final_project_kel_4/components/default_app_bar.dart';
import 'package:final_project_kel_4/components/default_back_button.dart';
import 'package:final_project_kel_4/components/default_button.dart';
import 'package:final_project_kel_4/pages/success.dart';
import 'package:flutter/material.dart';

import '../themes.dart';
import '../widgets/header_label.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBar(
        title: 'Payment',
        child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          const HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor: const Color(0xFFFFA45B),
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i!),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing:
                      Icon(paymentIcons[index], color: const Color(0xFFFFA45B)),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          DefaultButton(
            btnText: 'Pay',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Success(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
