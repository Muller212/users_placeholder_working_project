import 'package:flutter/material.dart';

class Constant {
  //Photo Page Constants
  static BoxDecoration photoPageContainer = const BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  );
  //

  //Post Page Constants
  static TextStyle postPageColor = const TextStyle(color: Colors.black);

  static TextStyle postPageTitle =
  const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0);

  static TextStyle postPageBody =
  const TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0);

  static BoxDecoration postPageContainer = const BoxDecoration(
    color: Color(0XFFdddddd),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

  //User Page Constants --  //width   //Text  //Container Decoration
  static const height1 = SizedBox(height: 10.0);
  static const height2 = SizedBox(height: 20.0);

  static const width1 = SizedBox(width: 10.0);
  static const width2 = SizedBox(width: 20.0);
  static const width3  = SizedBox(width: 40.0);

  static TextStyle userPageText = const TextStyle(fontSize: 16.0);

  static BoxDecoration userPageContainer = const BoxDecoration(
    color: Color(0XFFdddddd),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}