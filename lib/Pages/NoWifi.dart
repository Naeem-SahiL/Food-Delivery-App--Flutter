import 'package:flutter/material.dart';

class noWifi extends StatefulWidget {
  const noWifi({Key? key}) : super(key: key);

  @override
  _noWifiState createState() => _noWifiState();
}

class _noWifiState extends State<noWifi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/noWifi.png"),
              const Text(
                "No Internet Connection",
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
                      "Your internet connection is currently unavailable plese check and try again",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Container(
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
                        "Try Again",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ]),
              )
            ]),
      ),
    );
  }
}
