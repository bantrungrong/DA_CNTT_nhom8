import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getxapp/app/core/values/icons.dart';
import 'package:getxapp/app/core/values/colors.dart';

// ignore: non_constant_identifier_names
// List<Icon>  GetIcons(){
//   return const [
//     Icon(IconData(personIcon, fontFamily : "MaterialIcons"),color: purple,),
//     Icon(IconData(workIcon, fontFamily : "MaterialIcons"),color: pink,),
//     Icon(IconData(movieIcon, fontFamily : "MaterialIcons"),color: green,),
//     Icon(IconData(sportIcon, fontFamily : "MaterialIcons"),color: yellow,),
//     Icon(IconData(travelIcon, fontFamily : "MaterialIcons"),color: deepPink,),
//     Icon(IconData(shopIcon, fontFamily : "MaterialIcons"),color: lightBlue,),
//   ];
// }
class IconHelper{
   // ignore: non_constant_identifier_names
   List<Icon>  GetIcons(){
  return const [
  Icon(IconData(workIcon, fontFamily : "MaterialIcons"),color: pink,),
  Icon(IconData(movieIcon, fontFamily : "MaterialIcons"),color: green,),
  Icon(IconData(sportIcon, fontFamily : "MaterialIcons"),color: yellow,),
  Icon(IconData(travelIcon, fontFamily : "MaterialIcons"),color: deepPink,),
  Icon(IconData(shopIcon, fontFamily : "MaterialIcons"),color: lightBlue,),
  ];
  }
}
List<Icon> getIcons(){
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons')),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons')),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons')),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons')),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons')),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons')),
  ];
}