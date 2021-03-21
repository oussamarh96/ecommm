
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();

    if (isLogedin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
    User user = authResult.user;

     if (user !=null)   {
       final QuerySnapshot result = await FirebaseFirestore.instance.collection("users").where("id", isEqualTo: user.uid).get();
       final List<DocumentSnapshot> documents = result.docs;
       if (documents.length == 0) {
         FirebaseFirestore.instance.collection("users").doc(user.uid).set({
           "id": user.uid,
           "username": user.displayName,
           "profilePicture": user.photoURL
         });
         await preferences.setString("id", user.uid);
         await preferences.setString("username", user.displayName);
         await preferences.setString("photUrl", user.photoURL);
       }else{
         await preferences.setString("id", documents[0]['id']);
         await preferences.setString("username", documents[0]['username']);
         await preferences.setString("photUrl", documents[0]['photUrl']);
       }
       Fluttertoast.showToast(msg: "Login was successful");
       setState(() {
                loading= false;
              });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
     }else{
       Fluttertoast.showToast(msg: "Login was failed :(");
     }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
         Image.asset('images/back0.jpg',fit: BoxFit.cover, width: 500.0 , height: double.infinity),
         Container(
           alignment: Alignment.topCenter,
           child: Image.asset('images/logo1.png', width: 200.0 , height: 200.0),
         ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF64DAC4)),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 12.0,top: 12.0),
              child: FlatButton(
                color: Color(0xFF61AFB7),
                onPressed: () {
                  handleSignIn();
                },
                child: Text(
                  'SignIn/SignUp with Google',
                  style: TextStyle(color: Color(0xFFF1F3F6)),
                ),
            ),
          ),
       ),
    );

  }
  
}


