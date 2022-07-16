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
              onPressed: null,
            ),
          ),
        )
      ],
      backgroundColor: Colors.white.withOpacity(0),
    );
  }
}