import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pockectcheff/screens/login/login_screen.dart';
import 'package:pockectcheff/screens/search_recipe/ingredients_screen.dart';

class ChecagemPage extends StatefulWidget {
  const ChecagemPage({super.key});

  @override
  State<ChecagemPage> createState() => _ChecagemPageState();
}

class _ChecagemPageState extends State<ChecagemPage> {

  StreamSubscription? streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    streamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
          builder: (context) => LoginScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
          builder: (context) => IngredientsScreen(),
          ),
        );
      }
  });
  
  }

  @override
  void dispose(){
    streamSubscription!.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red)),
      )
    );
  }
}