import 'package:charity_app/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:charity_app/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _netIDTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0xFFF29100),
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // decoration: BoxDecoration(color: Colors.transparent),
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF3C942E),
                    ),
                    child: Text(
                      "Account verification email will be sent.",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // const Text(
                  //   "Account verification email will be sent",
                  //   style: TextStyle(color: Colors.white),
                  //   Rect
                  // const ColoredBox(color: green, height: 40),
                  // const SizedBox(
                  // height: 40,
                  // child: ColoredBox(color: green);
                  // ),
                  // TextField(
                  //   style: TextStyle(color: Colors.red),
                  //   e
                  //   decoration:
                  //       InputDecoration(fillColor: Colors.green, filled: true),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("First Name", Icons.person_outline, false,
                      _firstNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Last Name", Icons.person_outline, false,
                      _lastNameTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Email", Icons.email_outlined, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Password", Icons.lock_outlined, true,
                      _passwordTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("NetID", Icons.person_outline, false,
                      _netIDTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  signInSignUpButton(context, false, () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Created new account");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error on Sign Up");
                    });
                  })
                ],
              ),
            ))));
  }
}
