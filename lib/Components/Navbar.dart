import 'package:flutter/material.dart';
import 'package:foodapp/Pages/Offers.dart';
import 'package:foodapp/Pages/Orders.dart';
import 'package:foodapp/Pages/PrivacyPolicy.dart';
import 'package:foodapp/Pages/Profile.dart';
import 'package:foodapp/Pages/Security.dart';
import 'package:foodapp/utilities/authentication_service.dart';
import 'package:foodapp/utilities/constants.dart';

class Navbar extends StatelessWidget {
  const Navbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        backgroundColor: kOrnageColor,
        child: ListView(
          
          children:  [
            UserAccountsDrawerHeader(
              accountName: Text('Muhammad Naeem'),
              accountEmail: Text('sahilsahb3630@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Container(color: kOrnageColor,child: Image.asset('images/user.png', width: 90,height: 90,fit: BoxFit.cover)),
                ),
              ),
              decoration: BoxDecoration(color: kOrnageColor),
            ),
            NavItem(text: 'Profie',
                    icon: Icons.account_circle_outlined,
                    onClick: ()=> selectedItem(context, 0),
            ),
            NavItem(text: 'Orders',
                    icon: Icons.add_shopping_cart,
                    onClick: ()=> selectedItem(context, 1),
            ),
            NavItem(text: 'Offers and Promos',
                    icon: Icons.local_offer_outlined,
                    onClick: ()=> selectedItem(context, 2),
            ),
            NavItem(text: 'Privacy Policy',
                    icon: Icons.privacy_tip_outlined,
                    onClick: ()=> selectedItem(context, 3),
            ),
            NavItem(text: 'Security',
                    icon: Icons.security_outlined,
                    onClick: ()=> selectedItem(context, 4),
            ),
            NavItem(text: 'Log Out',
                    icon: Icons.logout,
                    onClick: ()=> AuthService().signout(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget NavItem({
    required String text,
    required IconData icon,
    VoidCallback? onClick,
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        
        leading: Icon(icon, color: kbackgroundColor,),
        title: Text(text, style: kNavitemTextStyle,),
        onTap: onClick,
      ),
    );
  }
  


void selectedItem(BuildContext context, int index){
  switch(index)
  {
    case 0:
    {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Profile()));}
    break;
    case 1:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Orders()));
    break;
    case 2:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Offers()));
    break;
    case 3:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const PrivacyPolicy()));
    break;
    case 4:
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Security()));
    break;
  }
}