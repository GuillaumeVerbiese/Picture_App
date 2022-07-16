// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'appbar.dart';
class Picture extends StatelessWidget {
  String picture;
  String profile_network;
  String description;
  String name;
  String time;

  Picture(this.picture, this.profile_network, this.description, this.name, this.time);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(),
      body: Page(picture, profile_network, description, name, time),
    );
  }
}


class Page extends StatelessWidget {
  String picture;
  String profile_network;
  String description;
  String name;
  String time;

  Page(this.picture, this.profile_network, this.description, this.name, this.time);
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                 picture,
                ),
                fit: BoxFit.cover,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: Stack(
              children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.network(profile_network),
                            width: 50,
                            margin: EdgeInsets.only(left: 10, right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Container(

                                margin: EdgeInsets.only(bottom: 10, right: 3),
                                child: Text(
                                  name, 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                  )
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3, bottom: 10),
                                child: Text(
                                  time + ' min',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),  
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  }
}