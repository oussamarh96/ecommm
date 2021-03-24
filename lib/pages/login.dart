/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myapp/pages/home.dart';
import 'package:firebase_core/firebase_core.dart'; */
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
//import 'test.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   /*
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
    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    User user = authResult.user;

    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection("users")
          .where("id", isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if (documents.length == 0) {
        FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          "id": user.uid,
          "username": user.displayName,
          "profilePicture": user.photoURL
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName);
        await preferences.setString("profilePicture", user.photoURL);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photUrl", documents[0]['photUrl']);
      }
      Fluttertoast.showToast(msg: "Login was successful");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Fluttertoast.showToast(msg: "Login was failed :(");
    }
  }
*/
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      height: size.height / 2.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff8CDBC4), Color(0xffBBD1F0),Color(0xffffc371)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                    ),
                  ),
                  Container(
                      height: size.height / 2.4,
                      width: double.infinity,
                      child: Image.network(
                          'https://cdn.iconscout.com/icon/free/png-256/grab-282266.png', height: 150.0,width: 150.0,))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Text(
                  "SIGN IN",
                  style: GoogleFonts.mukta(
                      color: Color(0xff15BAB3),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Colors.grey[200],
                      hintText: 'Email Address',
                      filled: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      fillColor: Colors.grey[200],
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      filled: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 210),
                child: Text("Forgot Password?",
                    style: GoogleFonts.mukta(
                        color: Colors.grey[500],
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 10),
                child: MaterialButton(
                  onPressed: () {},
                  // => handleSignIn(),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff15BAB3),
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      child: Center(
                          child: Text(
                        "SIGN IN",
                        style: GoogleFonts.mukta(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "OR",
                  style: GoogleFonts.mukta(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 108.0,right: 80.0,bottom: 2.0,top: 2.0),
                 child: Container(
                        height: 60.0,
                        width: 200.0,
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRR20Wl95JCVcyQ4b4dbpwOib99mRE2l_6tvA&usqp=CAU')),
               ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Don't have an account?",
                  style: GoogleFonts.mukta(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.mukta(
                      fontSize: 18,
                      color: Color(0xff15BAB3),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget social(String url) {
  return Material(
    borderRadius: BorderRadius.circular(8),
    elevation: 10,
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Image.network(
        url,
        height: 28,
        width: 28,
      ),
    ),
  );
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.1, size.height - 50);
    path.lineTo(size.width * 0.9, size.height - 50);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;

  }
}





