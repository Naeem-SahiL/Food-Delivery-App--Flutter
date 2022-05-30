import 'package:flutter/material.dart';
import 'package:foodapp/utilities/constants.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Security', style: kItemLabelTextStyle,),
        leading: BackButton(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30) ), color: Colors.white,),
              child:Text('The app is secured under the copy right of foodvilla. Any of its content leak will be chared according to the law.', style: kItemLabelTextStyle,) 
            ),
          ],
        ),
      ),
    );
  }
}