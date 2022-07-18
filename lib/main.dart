
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Homepage/appbar.dart';
import 'Homepage/imagegallery.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kosmosApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Récents',
                
                style: GoogleFonts.nunito(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            ImageGallery(),
            
          ],
        ),
      ),
      floatingActionButton: Container (
        margin: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: null,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
             
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }
}