import 'package:flutter/material.dart';
import 'package:serverpod/model/model.dart';
import 'package:toast/toast.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class view extends StatefulWidget {
  final Generate_User user;
  const view({@required this.user, Key key}) : super(key: key);
  @override
  State<view> createState() => _view();
}

class _view extends State<view> with TickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _animationController;
  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 260));
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }
  @override
  Widget build(BuildContext context) {
       ToastContext().init(context);
    return Scaffold(
    appBar: AppBar(title:Text('Re-generate'),centerTitle: true),
      body:  Center(child: Container(
            height:  MediaQuery.of(context).size.height-90,
            width: MediaQuery.of(context).size.width-50,
            decoration:   BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5),
                      height: 150,
                      width: 150,
                      decoration:BoxDecoration(shape: BoxShape.circle,
                         border: Border.all(color:  Colors.white,width: 3 ),
                  image:DecorationImage(fit:BoxFit.cover
                      ,image:NetworkImage(widget.user.img??''))   )),
                    Text(widget.user.gender,style: TextStyle(color:Colors.white )),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      height: 75,
                      width:  MediaQuery.of(context).size.width-70,
                      decoration:BoxDecoration(shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.white54,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0,8)
                            )] ,
                          color: Colors.white),
                  child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('${widget.user.title} ${widget.user.f_name}.${widget.user.l_name}',
                  style:TextStyle(fontSize: 25,fontWeight:FontWeight.w900 )) ,
                 Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children:[Row(children: [Text('Date Of Birth: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                   Text(widget.user.dob)
                 ]),Row(children: [Text('Age: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                   Text(widget.user.age)
                 ])]  )
                  ]) ),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      height: 190,
                      width:  MediaQuery.of(context).size.width-70,
                      decoration:BoxDecoration(shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.white54,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0,8)
                            )] ,
                          color: Colors.white),
                      child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Divider(height: 5,color: Colors.transparent),
                            Text(' Address: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                                  Text('  ${widget.user.address}',style: TextStyle(fontWeight:FontWeight.w900))
                                ,Text(' City.State: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                                  Text('  ${widget.user.city},${widget.user.state}',style: TextStyle(fontWeight:FontWeight.w900)),
                            Text(' Country,Postal_code: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                            Text('  ${widget.user.country},${widget.user.postal_code}',style: TextStyle(fontWeight:FontWeight.w900)),
                            Text(' Coordinates,Timezone: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                            Text('  ${widget.user.coordinates},${widget.user.timezone}',style: TextStyle(fontWeight:FontWeight.w900)),
                            Text(' Phone,Cell: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                            Text('  ${widget.user.phone},${widget.user.cell}',style: TextStyle(fontWeight:FontWeight.w900)),
                          ]) ),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      height: 100,
                      width:  MediaQuery.of(context).size.width-70,
                      decoration:BoxDecoration(shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.white54,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0,8)
                            )] ,
                          color: Colors.white),
                      child:Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
               Text('  Email: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                                  Text('   ${widget.user.email}',style: TextStyle(fontWeight:FontWeight.w900))
                               ,Text(' Username: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                              Text('   ${widget.user.uer_name}',style: TextStyle(fontWeight:FontWeight.w900)),
                            Text(' Password: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                            Text('   ${widget.user.password}',style: TextStyle(fontWeight:FontWeight.w900))
                          ]) )
                ])
        ) ),floatingActionButton: FloatingActionBubble(items:<Bubble> [
          Bubble( icon: Icons.copy, iconColor: Colors.white, title: '', titleStyle: null, bubbleColor: Colors.blue,
            onPress: () {  Clipboard.setData(ClipboardData(text:{'id':'${widget.user.id}','title':widget.user.title,'f_name':'${widget.user.f_name}', 'l_name':widget.user.l_name,
              'phone':widget.user.phone,'email':widget.user.email, 'dob':widget.user.dob,'age':widget.user.age,'uer_name':widget.user.uer_name,
              'password':widget.user.password,'city':widget.user.city,'state':widget.user.state, 'gender':widget.user.gender,'address':widget.user.address,
              'img':widget.user.img, 'country':widget.user.country,'timezone':'${widget.user.timezone}',
              'coordinates':'${widget.user.coordinates}', 'postal_code':widget.user.postal_code,'cell':widget.user.cell }.toString() ));
            Toast.show('Copied to Clipboard',gravity: Toast.bottom,duration: Toast.lengthLong); }),
      Bubble( icon: Icons.download_sharp, iconColor: Colors.white, title: '', titleStyle: null, bubbleColor: Colors.blue,
          onPress: () async{
          Uint8List bytes=  ( await NetworkAssetBundle(Uri.parse(widget.user.img)).load(widget.user.img))
          .buffer.asUint8List();
        await ImageGallerySaver.saveImage(Uint8List.fromList(bytes));
        Toast.show('Saved to Gallery',gravity: Toast.bottom,duration: Toast.lengthLong); }),
      Bubble( icon: Icons.arrow_drop_down, iconColor: Colors.white, title: '', titleStyle: null, bubbleColor: Colors.blue,
          onPress: () { Clipboard.setData(ClipboardData(text:'${widget.user.f_name} ${widget.user.l_name}' ));
        Toast.show('First and last name Copied',gravity: Toast.bottom,duration: Toast.lengthLong);  })
    ], iconData: Icons.keyboard_arrow_down_rounded,
      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: null, backGroundColor: null)
    );
  }
}