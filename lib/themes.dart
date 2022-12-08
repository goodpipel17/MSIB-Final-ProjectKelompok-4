import 'package:flutter/material.dart';

import 'models/payment_modals.dart';

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.grey,
);

const String success = 'assets/success.gif';

final paymentLabels = [
  'Credit card / Debit card',
  'Cash on delivery',
  'Paypal',
  'Google wallet',
];

final paymentIcons = [
  Icons.credit_card,
  Icons.money_off,
  Icons.payment,
  Icons.account_balance_wallet,
];

final paymentDetailList = [
  PaymentModal(
      date: "Jan 01",
      details: "Buy IPhoneX",
      amount: 1000.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Aug 15",
      details: "Flat ₹650 off",
      amount: 650.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Dec 03",
      details: "Congrats! Flat ₹180",
      amount: 180.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Feb 14",
      details: "Buy Shoes Upto 50% Off",
      amount: 540.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Sep 08",
      details: "Buy Footwear on Discount",
      amount: 210.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Apr 18",
      details: "Congrats! ₹375 Rewarded",
      amount: 375.0,
      textColor: Colors.green),
];
