import 'package:flutter/material.dart';
import '../Homepage/picturecards.dart';


class ImageGallery extends StatelessWidget {
  final List imagesList = [
    {
      'title': 'desert',
      'picture': 'images/desert.jpg',
      'name': 'Anna Clark',
      'profile': 'images/profil.png',
      'profile_network': 'https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png',
      'text': 'Une superbe balade ❤',
      'time': '22',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla purus placerat nibh accumsan, et pulvinar lorem semper.',
    },

    {
      'title': 'mont Saint-Michel',
      'picture': 'images/mont-saint-michel-nuit.jpg',
      'name': 'Anna Clark',
      'profile': 'images/profil.png',
      'profile_network': 'https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png',
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