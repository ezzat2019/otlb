import 'package:flutter/material.dart';
import 'package:otlb/main.dart';

abstract class NavigationManager{
  static void goto(sc){
    Navigator.of(myContext!).push(
      MaterialPageRoute(builder: (context) => sc,)
    );
  }
  static void gotoAndKill(sc){
    Navigator.of(myContext!).pushReplacement(
        MaterialPageRoute(builder: (context) => sc,)
    );
  }
  static void gotoAndKillAll(sc){
    Navigator.of(myContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => sc,),(route) => false,
    );
  }
  void back(){
    Navigator.of(myContext!).pop();
  }
}