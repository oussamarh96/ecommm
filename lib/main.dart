
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';
import 'package:myapp/pages/login.dart';

void main(){

  runApp(MaterialApp(
    home: HomePage(),
  ));
}

// hedhi ta3mel intialisation mta3 firebase
class Appp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Login();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return HomePage();
      },
    );
  }
}
