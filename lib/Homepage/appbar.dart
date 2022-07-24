// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';



class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  Size get preferredSize => new Size.fromHeight(50);
  
  @override
  Widget build(BuildContext context) {
        
    final user = FirebaseAuth.instance.currentUser;
    
        
        
    return AppBar(
      title: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                      Text(
                        
                      'Bonjour,  ${user?.email ?? 'toi'} 👋',
                      
                    style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontSize: 10,
                    ),        
                    ),

                    Text(
                    "Fil d'actualités",
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                 
                ],                
              ),
            ),
          ),
      actions: [
        Padding(
          padding: EdgeInsets.all(6.0),
          child: GestureDetector(
            child: CircleAvatar(
            radius: 18.0,
            backgroundImage: 
            NetworkImage('https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png'),
            backgroundColor: Colors.transparent,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(
                    
                  ),
                ),
              );
            },
          ),
        ),


        Padding(
          padding: EdgeInsets.all(2.0),
          child: IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 35,
            ),
          onPressed: () => FirebaseAuth.instance.signOut(), 

        ),
        ),


        
      ],
      
      
      backgroundColor: Colors.white,
    );
  }
}