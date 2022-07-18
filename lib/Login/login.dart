

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'appbar.dart';


class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
  
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: MyAppBar(),
    body:SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          child: Padding(padding: EdgeInsets.only(bottom: 40),
            child: Text(
              'Connectez-vous ou créez un compte.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        
        SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(
              'Email',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        
        
        
        Material(
          child: TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: 'Saisissez votre Email'),
          ),
        ),
        Text('Password'),
        SizedBox(height: 4),
        Material(
          child: TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
        ),
        
        SizedBox(height: 40),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
          icon: Icon(Icons.lock_open, size: 32),
          label: Text(
            'Connexion',
            style: TextStyle(fontSize: 24),
          ),
          onPressed:() {},
        ),
      ],
    ),
  ),
);
  
}