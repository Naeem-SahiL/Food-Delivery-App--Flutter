import 'package:flutter/material.dart';
import 'package:foodapp/Pages/Favourites.dart';
import 'package:foodapp/utilities/constants.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);


  void popup(BuildContext context, String message, String btn_Text){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // color: Colors.red,
          // width: 200,
          // height: 200,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SimpleDialog(
              children: <Widget>[
                 Text(
                  message,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontFamily: 'SFProTextSemibold'),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Favourites()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0),
                        ),
                        fixedSize: const Size(270, 60),
                        primary: kOrnageColor),
                    child:  Text(
                      btn_Text,
                      style: kButtonLabelTextStyle,
                    ))
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          title: const Text(
            'Product Details',
            style: kItemLabelTextStyle,
          ),
          leading: BackButton(color: Colors.black),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                tooltip: 'Favourites',
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context)=> Favourites())
                  // );
                  // popup(context, 'Product added to favourites succcessfully.', 'View in favourites');
                   final snackBar = SnackBar(
                  content: const Text('Product added to favourites succcessfully.'),
                  action: SnackBarAction(
                    label: 'View in favourites',
                    onPressed: () {
                       Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=> Favourites())
                      );
                    },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset('images/tomatoMix.png'),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Veggie tomatto mix',
                      style: kItemLabelTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rs. 900',
                      style: kItemPriceTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Info',
                      style: kItemLabelTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Text(
                      'Delivery between monday and thursday 20 from 8pm to 6am',
                      style: kNormalTextStyle,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Return Policy',
                      style: kItemLabelTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Text(
                      'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                      style: kNormalTextStyle,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
        
                            fixedSize: Size(300, 60),
                            primary: kOrnageColor),
                        child: Text(
                          'Add to cart',
                          style: kButtonLabelTextStyle,
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
