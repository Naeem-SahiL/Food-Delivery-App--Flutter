import 'package:flutter/material.dart';
import 'package:foodapp/Pages/HomePage.dart';
import 'package:foodapp/utilities/constants.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Orders', style: kItemLabelTextStyle,),
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black),
        elevation: 0,
      ),
       body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/Orders.png"),
              const Text(
                "No Orders yet!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 40),
                alignment: Alignment.center,
                width: 200,
                padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hit the orange button down below to Create an order",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  var count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                                  },
                child: Container(
                  width: 180,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Start Ordering",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ]),
                ),
              )
            ]),
      ),
    
    );
  }
}