import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testdemo/registration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});
  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
 
 final _formKey = GlobalKey<FormState>();
 final TextEditingController emailEditingController =  TextEditingController();
 final TextEditingController passEditingController =  TextEditingController();

 final _auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty) {
          return ("Please return your email");
        }

        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );

    final passField = TextFormField(
      autofocus: false,
      controller: passEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regExp = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regExp.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
      },
      onSaved: (value) {
        passEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
    );

    final loginButton = Material(
      elevation: 5,
      color: Colors.greenAccent,
      
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailEditingController.text, passEditingController.text);
        },
        child: Text("Login",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        ),
        ),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  emailField,
                  SizedBox(height: 10,),
                  passField,
                  SizedBox(height: 20,),
                  loginButton,
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                      }, child: Text("Sign up",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                      ),
                      ))
                    ],
                  )
                ],
              )),
            ),
          ),
        ),
      ),
      
    );
  }

void signIn(String email, String password) async {
  if(_formKey.currentState!.validate()) {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage())),
                });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {}
    }
  }
}
}

