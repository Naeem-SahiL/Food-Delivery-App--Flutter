import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Pages/HomePage.dart';
import 'package:foodapp/Pages/Login.dart';

class AuthService{

  handleAuth(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return HomePage();
        }
        else{
          return Login_screen();
        }
      },
    );
  }

  signout(){
    FirebaseAuth.instance.signOut();
  }
  bool signIn(email, password){
    bool status = false;
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
    .then((user){status =  true;}).catchError((e){
      print(e);
    });
    return status;
  }

}