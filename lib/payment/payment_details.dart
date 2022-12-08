import 'package:final_project_kel_4/components/default_app_bar.dart';
import 'package:final_project_kel_4/components/default_back_button.dart';
import 'package:final_project_kel_4/widgets/sticky_label.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

import '../themes.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({Key? key}) : super(key: key);

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "Farhan Maulana",
      bankName = "Bank BCA",
      cvv = "369";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBar(
          title: "Payment Details", child: DefaultBackButton()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),
            const StickyLabel(
              text: "Card Information",
              textColor: null,
            ),
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("My Personal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: const Icon(Icons.payment,
                                color: Color(0xFFFFA45B), size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                cvv,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () => print("Edit Detail"),
                      style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      )),
                      child: const Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const StickyLabel(
              text: "Transaction Details",
              textColor: null,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.shade600,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentDetailList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentDetailList[index].date!,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Container(
                        width: 190.0,
                        child: Text(
                          paymentDetailList[index].details!,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Container(
                        width: 70.0,
                        child: Text(
                          "\$ ${paymentDetailList[index].amount}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: paymentDetailList[index].textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade600,
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
