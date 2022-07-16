// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../page_picture/picture.dart';


class PictureCard extends StatelessWidget {
  final Map imageData;
  PictureCard(this.imageData);
  
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(top:6),

      child: Stack(
        children: [

          GestureDetector(

            child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                 imageData['picture'],
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
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Picture(
                    imageData['picture'],
                    imageData['profile'],
                    imageData['description'],
                    imageData['name'],
                    imageData['time'],
                  ),
                ),
              );
            },
          ),

          

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
            NetworkImage(imageData['profile_network']),
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