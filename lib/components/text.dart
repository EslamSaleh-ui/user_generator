

import 'package:flutter/material.dart';

class text extends StatelessWidget{
  final String texts;
  final Color color ;
  final FontWeight fontWeight;

  const text({@required this.color, this.texts,  this.fontWeight,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(this.texts,style: TextStyle(color: this.color,fontWeight:this.fontWeight));
  }

}