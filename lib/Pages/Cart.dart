import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constants.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Cart', style: kItemLabelTextStyle,),
        leading: BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child:Text('Oops! No Offers yet', style: kItemLabelTextStyle,) 
      ),
    );
  }
}