import 'package:charity_app/reusable_widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:charity_app/screens/home_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailTextController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0xFFF29100),
          elevation: 0,
          title: const Text(
            "Reset Password",
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
                      "An email will be sent to reset your password.",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Email", Icons.email_outlined, false,
                      _emailTextController),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgotPassButton(_emailTextController),
                ],
              ),
            ))));
  }

  Container ForgotPassButton(TextEditingController email) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      // decoration: BoxDecoration(borderRadius: BorderRadius.zero),
      child: ElevatedButton(
        onPressed: () {
          auth.sendPasswordResetEmail(email: email.text);
          Navigator.of(context).pop();
        },
        child: Text(
          'Reset Password',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return Color(0xFFF29100);
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero))),
      ),
    );
  }
}
