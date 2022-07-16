import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  String picture;
  String profile;
  String description;
  String name;
  String time;

  Picture(this.picture, this.profile, this.description, this.name, this.time);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      ),
    );
  }
}