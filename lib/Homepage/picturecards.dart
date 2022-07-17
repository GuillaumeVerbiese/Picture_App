// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last


import 'package:flutter/foundation.dart';
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
                    imageData['profile_network'],
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
              onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => buildSheet(context),
              ), 
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
  Widget buildSheet(context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        flex: 10,
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
          ),
          child: Text(
          'que souhaitez-vous faire ?',
          textAlign: TextAlign.center,
          
            style: TextStyle(
              color: Color.fromARGB(255, 101, 101, 101).withOpacity(1),
              fontSize: 14,
              
            ),
          ),
        ),
        
        
      ),

      Flexible(
        flex: 10,
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
          ),
          child: TextButton(
            child: Text(
              'Supprimer la publication',
              style: TextStyle(
                color: Colors.red,
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: null,
            
          ), 
        ),
        
        
      ),

Flexible(
        flex: 10,
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.05,
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: SizedBox (
            width: double.infinity,
            child: TextButton(
              child: Text(
                'Annuler',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(), 
            ), 
          )
          
        ),
      ),
    ],
  );