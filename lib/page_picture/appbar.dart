// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(70);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 10, top: 8),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.2),
          radius: 22,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      // title: Text(''),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10, top: 8),
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.2),
            radius: 22,
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 22,
              ),
              onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => buildSheet(context),
              ),
            ),
          ),
        )
      ],
      backgroundColor: Colors.white.withOpacity(0),
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
            color: Colors.white.withOpacity(0.8),
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
            color: Colors.white.withOpacity(0.8),
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