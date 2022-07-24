

// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../Homepage/homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: MyAppBar(),
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginWidget();
        }
      },
    ),

    );

}


class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
  
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordReset = TextEditingController();

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    passwordReset.dispose();

    super.dispose();
  }

  @override

  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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

        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Password',
              textAlign: TextAlign.left,
            ),
          ),
        ),
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
            primary: Colors.black,
            minimumSize: Size.fromHeight(50),
          ),
          icon: Icon(Icons.lock_open, size: 32),
          label: Text(
            'Connexion',
            style: TextStyle(fontSize: 24),
          ),
          onPressed:signIn,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mot de passe oublié ?'),
            TextButton(
              onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => buildSheet(context),
              ),
                child: Text(
                  'Réinitialiser',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              )
          ],
          
        ),
      ],

    ),
  );

Future signIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text.trim(),
    password:passwordController.text.trim(),
  );
}

Widget buildSheet(context) => Container(
  
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
  ),
  
  child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
         Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
          
            decoration: BoxDecoration(
              color: Colors.white,
              
            ),
            child: Text(
            'Réinitialiser mot de passe',
          textAlign: TextAlign.center,
          
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              
            ),
          ),
        ),


        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * 0.9,
          
            decoration: BoxDecoration(
              color: Colors.white,
              
            ),
            child: Text(
            "Entrez l'adresse email associée à votre compte. Nous vous renverrons un email de réinitialisation sur celle-ci.",
          textAlign: TextAlign.center,
          
            style: TextStyle(
              color: Color.fromARGB(255, 101, 101, 101).withOpacity(1),
              fontSize: 16,
              
            ),
          ),
        ),
        
       
          Container(
            
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(top: 45),

            child: Text(
              'email',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        SizedBox(height: 10),
        Container(
          
          width: MediaQuery.of(context).size.width * 0.9,
          child: Material(
            child: TextField(
             
              controller: passwordReset,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: 'john.doe@gmail.com',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: true,
            ),
          ),
        ),

        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.only(bottom: 25, top: 65),
          child: ElevatedButton(
            child: Text(
            'Réinitialiser',
            style: TextStyle(fontSize: 24),
            ),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            
          
          onPressed:() {
            FirebaseAuth.instance.sendPasswordResetEmail(email: passwordReset.text.trim());
            Navigator.of(context).pop();
          },
        ) ,
        ),
        
        
    ],
  ),


 );
 
  
}

 