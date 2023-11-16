import 'package:firebase1/second.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();

  void sihnup() async {
    try {
      var data = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: txt.text, password: txt1.text);
      //print("hello");
    } catch (e) {
      print(e);

      String error = e.toString();

      if (error.contains("Password should be at least 6 characters")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Password should be at least 6 characters")));
      }
      if (error.contains("The email address is badly formatted")) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The email address is badly formatted")));
      }
      if (error.contains("Given String is empty or null")) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Given String is empty or null")));
      }
      if (error
          .contains("The email address is already in use by another account")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "The email address is already in use by another account")));
      }
    }
  }

  login() async {
    try {
      var data = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: txt.text, password: txt1.text);
      // if (data != null) {
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => Second(),
      //   ));
      // }
    } catch (v) {
      print(v);
      String error = v.toString();
      if (error.contains(
          "The password is invalid or the user does not have a password.")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "The password is invalid or the user does not have a password.")));
      }
      if (error.contains(
          "We have blocked all requests from this device due to unusual activity. Try again later.")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "We have blocked all requests from this device due to unusual activity. Try again later.")));
      }
      if (error.contains(
          "here is no user record corresponding to this identifier. The user may have been deleted.")) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "here is no user record corresponding to this identifier. The user may have been deleted.")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          TextField(
            controller: txt,
            decoration: InputDecoration(
              hintText: "Email Id",
            ),
          ),
          TextField(
            controller: txt1,
            decoration: InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
              onPressed: () {
                login();
              },
              child: Text("Login")),
          ElevatedButton(
              onPressed: () {
                sihnup();
              },
              child: Text("Signup")),
        ]),
      ),
    );
  }
}
