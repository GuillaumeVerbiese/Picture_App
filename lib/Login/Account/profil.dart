// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kosmosapp/Homepage/homepage.dart';
import '../../Login/appbar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: MyAppBar(),
    body: ProfileAccountPage(),
  );
}

class ProfileAccountPage extends StatefulWidget {
  @override
  _ProfileAccountPageState createState() => _ProfileAccountPageState();
  
}

class _ProfileAccountPageState extends State<ProfileAccountPage> {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  // final pictureController = TextEditingController();


  @override
  void dispose() {

    firstnameController.dispose();
    lastnameController.dispose();
    // pictureController.dispose();

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
              'Créez votre profil',
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
              'Nom*',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        
        
        
        Material(
          child: TextField(
            controller: lastnameController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Saisissez votre nom',
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              obscureText: false,
          ),
        ),

// Password
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Prénom*',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 4),
        Material(
          child: TextField(
            controller: firstnameController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Saisissez votre prénom',
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            obscureText: false,
          ),
        ),


        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(top: 25),
            child: Text(
              'Photo de profil*',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade200,
            minimumSize: Size.fromHeight(150),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          icon: Icon(Icons.upload_file_rounded, size: 16, color: Colors.grey,),
          label: Text(
            'Appuyer pour choisir une photo',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          onPressed:() async {
            final results = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['png', 'jpg'],
            );

            if (results == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pas de fichier sélectionné')
                )
              );
              return null;
            }
            final path = results.files.single.path!;
            final fileName = results.files.single.name;
          },
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
          //  createUser();
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    
                  ),
                ),
              );

            } 
        ) ,
        ),
      ],
    ),
  );
}