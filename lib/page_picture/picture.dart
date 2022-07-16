import 'package:flutter/material.dart';
import 'appbar.dart';
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
      appBar: MyAppBar(),
      body: Container(
      ),
    );
  }
}