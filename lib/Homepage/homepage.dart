// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'imagegallery.dart';



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