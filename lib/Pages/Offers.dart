import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constants.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Offers and Promos', style: kItemLabelTextStyle,),
        leading: BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Oops! No Offers yet', style: kItemLabelTextStyle,),
            Text('You don’t have any offersyet please check again.', style: kGreyTextStyle,),
          ],
        ) 
      ),
    );
  }
}