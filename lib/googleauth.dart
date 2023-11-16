import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({Key? key}) : super(key: key);

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {


  googlesign()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleuser=  await googleSignIn.signIn();
    GoogleSignInAuthentication? googleAuth = await googleuser!.authentication;

   var credential =  GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

   await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            googlesign();
          },
          child: Text("google sigin"),
          color: Colors.red,
        ),
      ),
    );
  }
}
