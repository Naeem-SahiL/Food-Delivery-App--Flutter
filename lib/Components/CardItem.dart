import 'package:flutter/material.dart';
import 'package:foodapp/utilities/Storage_service.dart';
import 'package:foodapp/utilities/constants.dart';

class CardItem extends StatelessWidget {
  CardItem({@required this.image = 'image.png', this.itemLable = 'label', this.itemPriceLable = 'price'});
  double cardHeight = 0.35;
  double cardWidth = 0.28;
  String image;

  String itemLable;
  String itemPriceLable;

  // double cardHeigth = MediaQuery.of(Crdcontext).size.height * 0.35;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      height: MediaQuery.of(context).size.height * cardHeight,
      width: MediaQuery.of(context).size.height * cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularImage(image: image),
          Container(
            constraints: BoxConstraints.loose(
              Size.fromHeight(10),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children:  [
                Positioned(
                  top: -25,
                  width: 125,
                  child: Text(
                    itemLable,
                    style: kItemLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text(
            itemPriceLable,
            style: kItemPriceTextStyle,
          ),
          
        ],
      ),
    );
  }
}

class CircularImage extends StatefulWidget {
   CircularImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  State<CircularImage> createState() => _CircularImageState();
}

class _CircularImageState extends State<CircularImage> {
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.loose(
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -50,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: MediaQuery.of(context).size.height * 0.21,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    (MediaQuery.of(context).size.height * 0.21) / 2),
                  child: Image.asset('images/tomatoMix.png'),
                // child: FutureBuilder(
                //   future: storage.downloadURL('image.png'),
                //   builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                //     if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                //       return Image.asset('images/tomatoMix.png');
                //       // return Image.network(snapshot.data!);
                //     }
                    
                //     if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                //       return const CircularProgressIndicator();
                //     }
                //     return Container();
                //   },
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
