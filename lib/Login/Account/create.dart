// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kosmosapp/Homepage/homepage.dart';
import 'package:kosmosapp/Login/Account/profil.dart';
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
            if (passwordController.text == verifyPasswordController.text ) {
              createUser();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(
                    
                  ),
                ),
              );

            } else {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => buildSheet(context),
                constraints: BoxConstraints(
                  minWidth: 450,
                  maxWidth: 500,              
                ),
              );
            }
            
          },
        ) ,
        ),
      ],
    ),
  );

Future createUser() async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text.trim(),
    password:passwordController.text.trim(),
  );
}

Widget buildSheet(context) => Center(
  child: Container(
    padding: EdgeInsets.all(10),
  width: MediaQuery.of(context).size.width * 0.5,
  
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
  ),
  
  child: Column(
    
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
         Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width * 0.9,
          
            decoration: BoxDecoration(
              color: Colors.white,
              
            ),
            child: Text(
            'Les mots de passes ne sont pas identiques veuillez réessayer la saisie des informations',
          textAlign: TextAlign.center,
          
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              
            ),
          ),
        ),
      
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.only(bottom: 25, top: 15),
          child: ElevatedButton(
            child: Text(
            'Fermer',
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
            Navigator.of(context).pop();
          },
        ) ,
        ),
        

        
        
    ],
  ),

  ),
 );

}