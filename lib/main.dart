
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
      
      // bottomNavigationBar: BottomSection(),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
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
                    'Bonjour, Anna 👋',
                    style: GoogleFonts.nunito(
                      color: Colors.grey[500],
                      fontSize: 15,
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
          child: CircleAvatar(
            radius: 18.0,
            backgroundImage: 
            NetworkImage('https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png'),
            backgroundColor: Colors.transparent,
        )
        )

        // IconButton(
        //   onPressed: null, 
        //   icon: Icon(
        //     Icons.account_circle,
        //     color: Colors.black,
        //     size: 35,
        //   ),
        // ),
      ],
      
      
      backgroundColor: Colors.white,
    );
  }
}
class ImageGallery extends StatelessWidget {
  final List imagesList = [
    {
      'title': 'desert',
      'picture': 'images/desert.jpg',
      'name': 'Anna Clark',
      'profile': 'images/profil.png',
      'text': 'Une superbe balade ❤',
      'time': '22',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla purus placerat nibh accumsan, et pulvinar lorem semper.',
    },

    {
      'title': 'mont Saint-Michel',
      'picture': 'images/mont-saint-michel-nuit.jpg',
      'name': 'Anna Clark',
      'profile': 'images/profil.png',
      'text': 'Une superbe ville ❤',
      'time': '42',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla purus placerat nibh accumsan, et pulvinar lorem semper.',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          
          Column(
            children: imagesList.map((image) {
              return PictureCard(image);
            }).toList(),
          )
        ],
      ),
    );
  }
}

class PictureCard extends StatelessWidget {
  final Map imageData;
  PictureCard(this.imageData);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(top:6),
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage(
            imageData['picture']
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [

          Positioned(
            top: 10,
            right: 5,
            child: IconButton(
              onPressed: null, 
              icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 20,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 10,
            child: CircleAvatar(
            radius: 18.0,
            backgroundImage: 
            NetworkImage('https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png'),
            backgroundColor: Colors.transparent,
        )
          ),
          
          Positioned(
            bottom: 40,
            left: 60,
            child: Text(
              imageData['name'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 170,
            child: Text(
              imageData['time']+' min',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          Positioned(
            bottom: 15,
            left: 60,
            child: Text(
              imageData['text'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BottomSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.pause),
//           label: 'add picture',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.pause),
//           label: 'add picture',
//         ),
//       ],
//     );
//   }
// }