import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
         await FirebaseAuth.instance.signOut();
        },child: Text("signout"),
      ),
      body: Center(
        child: Text("welcome"),
      ),
    );
  }
}
