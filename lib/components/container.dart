

import 'package:flutter/material.dart';

class container extends StatelessWidget{
  final Color color;
  final double opacity;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double height;
  final double width;
  const container({@required this.color,@required this.opacity,this.bottom,this.top,this.right,this.left,
   @required this.height,@required this.width,Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Positioned(child:
      Container(margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(shape: BoxShape.circle,color: this.color.withOpacity(this.opacity)),
        height: MediaQuery.of(context).size.height/this.height,
        width:MediaQuery.of(context).size.width/this.width ),left:this.left ,right:this.right ,top:this.top ,bottom:this.bottom );
  }

}