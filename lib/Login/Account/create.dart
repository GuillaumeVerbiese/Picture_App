// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Login/appbar.dart';

class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: MyAppBar(),
    body: CreateAccountPage(),
  );
}

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
  
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();

    super.dispose();
  }

  @override

  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Title
        Container(
          width: 300,
          child: Padding(padding: EdgeInsets.only(bottom: 40),
            child: Text(
              'Créez un compte',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
// Email
        SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              'Adresse Email',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        
        
        
        Material(
          child: TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Saisissez votre Email',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: true,
          ),
        ),

// Password
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Mot de passe',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 4),
        Material(
          child: TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            obscureText: true,
          ),
        ),

// Verify password
         Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Confirmation mot de passe',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 4),
        Material(
          child: TextField(
            controller: verifyPasswordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Confirmation mot de passe',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            obscureText: true,
          ),
        ),


        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(bottom: 25, top: 15),
          child: ElevatedButton(
            child: Text(
            'Continuer',
            style: TextStyle(fontSize: 16),
            ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
            
          
          onPressed:() {
            
          },
        ) ,
        ),
      ],
    ),
  );
}