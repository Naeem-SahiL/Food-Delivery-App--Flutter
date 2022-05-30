import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/Components/CardItem.dart';
import 'package:foodapp/Pages/Cart.dart';
import 'package:foodapp/Pages/Prduct.dart';
import 'package:foodapp/Pages/Profile.dart';
import 'package:foodapp/models/item.dart';
import 'package:foodapp/utilities/constants.dart';
import 'package:foodapp/Components/Navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          drawer: const Navbar(),
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF2F2F2),
          appBar: AppBar(
            
            iconTheme: const IconThemeData(color: Colors.black),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                tooltip: 'Cart',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> Cart())
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(child: navigationList[tabIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabIndex,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: kunselectedColor,
            selectedItemColor: kOrnageColor,
            selectedIconTheme: IconThemeData(size: 28),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
                
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.clock),
                label: '',
              ),
            ],
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

final List<Widget> navigationList = [
  Home(),
  Container(
    child: Center(
      child: Text('Heart'),
    ),
  ),
 Profile(),
  Container(
    child: Center(
      child: Text('Clock'),
    ),
  ),
];

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Object>_itemList = [];
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    getItemList();
  }
  @override
  
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            
            children: [
              Row(
                children: [
                  const Text('Delicious', style: kHeaderTextStyle,),
                ],
              ),
              Row(
              children: [
              const Text('food for you', style: kHeaderTextStyle,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: TextField(
              
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
              prefixIcon: Container(
                child: Icon(Icons.search),
                width: 30,
              )
            )
        ),
          ),
            ],
            
          ),
        ),
       
        
        const TabBar(
          indicatorColor: kOrnageColor,
          labelColor: kOrnageColor,
          unselectedLabelColor: Color(0xFF9A9A9D),
          isScrollable: true,
          tabs: [
            Tab(
              text: 'Foods',
            ),
            Tab(
              text: 'Drinks',
            ),
            Tab(
              text: 'Snacks',
            ),
            Tab(
              text: 'Snacks',
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'see more',
                          style: klinkTextStyle,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: _itemList.length,
                      itemBuilder: (context,index) { 
                        return ListItem(_itemList[index] as Item);
                       },),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: Column(
                  children: [
                    Text('link'),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Text('child'),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Text('child'),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Text('child'),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Text('child'),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Text('child'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ]),
    );
  }

  Future getItemList() async{
    var data = await FirebaseFirestore.instance
      .collection('products')
      .doc('mNqw6hQmhYCwd0XgBubA')
      .collection('foods')
      .get();

      setState(() {
        _itemList = List.from(data.docs.map((doc) => Item.fromSnapShot(doc)));
      });
  }
}

class ListItem extends StatelessWidget {
  final Item _item;
  ListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Product()))},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: CardItem(
            image: 'image.png',
            itemLable: "${_item.name}",
            itemPriceLable: "Rs. ${_item.price}",
          ),
        ),
      ),
    );
  }
}
