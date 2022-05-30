import 'package:flutter/material.dart';
import 'package:foodapp/utilities/authentication_service.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  _Login_screenState createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? email, password;

  final formKey = new GlobalKey<FormState>();

  checkFields() {
    final form = formKey.currentState;

    
  }
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("images/login_img.png"),
                TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.deepOrange,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ]),
              ]),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.60,
            color: const Color(0xFFEDEDED),
            padding: const EdgeInsets.all(50),
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Form(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  label: Text("Email Address"),
                                  border: UnderlineInputBorder()),
                                  // validator: (value)=> value.isEmpty? 'Email is required',
                                  onChanged: (value){
                                    this.email = value;
                                  },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  label: Text("Password"),
                                  border: UnderlineInputBorder()),
                                   onChanged: (value){
                                    this.password = value;
                                  },
                            ),
                            const Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ]),
                    ),
                    GestureDetector(
                      onTap: (){
                        bool status = AuthService().signIn(email, password);
                        var str = '';
                        if(status){
                          str = 'You are signed in succcessfully.';
                        }else{
                          str = 'Something went wromg!';
                        }
                        final snackBar =  SnackBar(
                                  content:  Text(str),
                          );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 280,
                        height: 65,
                        margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                label: Text("UserName"),
                                border: UnderlineInputBorder()),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                label: Text("Email"),
                                border: UnderlineInputBorder()),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                label: Text("Password"),
                                border: UnderlineInputBorder()),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                label: Text("Confifrm Password"),
                                border: UnderlineInputBorder()),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 280,
                      height: 65,
                      margin: const EdgeInsets.fromLTRB(0, 19, 0, 0),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ]),
    );
  }
}
