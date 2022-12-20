import 'package:flutter/material.dart';

class user_img extends StatelessWidget{
  final String texts;
  const user_img({this.texts, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
       margin: EdgeInsets.only(top: 5,bottom: 5),
       height: 150,
       width: 150,
       decoration:BoxDecoration(shape: BoxShape.circle,
           border: Border.all(color:  Colors.white,width: 3 ),
           image:DecorationImage(fit:BoxFit.cover
               ,image:NetworkImage(this.texts??''))   ));
  }
}