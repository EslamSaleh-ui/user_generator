import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod/components/text.dart';
import 'package:serverpod/components/user_img.dart';
import 'package:serverpod/model/model.dart';
import 'package:toast/toast.dart';
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
    List<String> getter1=[' Address: ','  ${widget.user.address}',' City.State: ',
      '  ${widget.user.city},${widget.user.state}',' Country,Postal_code: ',
    '  ${widget.user.country},${widget.user.postal_code}',' Coordinates,Timezone: ',
      '  ${widget.user.coordinates},${widget.user.timezone}',' Phone,Cell: ',
      '  ${widget.user.phone},${widget.user.cell}'];
    List<String> getter2=['  Email: ','   ${widget.user.email}',' Username: ',
      '   ${widget.user.uer_name}', ' Password: ','   ${widget.user.password}'];
    ToastContext().init(context);
    return ProviderScope(child:Scaffold(
    appBar: AppBar(title:Text('Re-generate'),centerTitle: true),
      body:  Center(child: Container(
            height:  MediaQuery.of(context).size.height-90,
            width: MediaQuery.of(context).size.width-50,
            decoration:   BoxDecoration(color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child:SingleChildScrollView(child:
            Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 user_img(texts: widget.user.img??''),
                    Text(widget.user.gender,style: TextStyle(color:Colors.white )),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      constraints: BoxConstraints(
                          maxHeight: double.infinity ),
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
                 Divider(height: 20,color: Colors.transparent),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children:[Row(children: [Text('Date Of Birth: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                   Text(widget.user.dob)
                 ]),Row(children: [Text('Age: ',style: TextStyle(color: Colors.blue.shade900,fontWeight:FontWeight.w900)),
                   Text(widget.user.age)
                 ])]  ),
                        Divider(height: 10,color: Colors.transparent)
                      ]) ),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      constraints: BoxConstraints(
                          maxHeight: double.infinity ),
                      width:  MediaQuery.of(context).size.width-70,
                      decoration:BoxDecoration(
                          shape: BoxShape.rectangle,
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
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:  getter1.map((e) =>text(texts: e,color:getter1.indexOf(e)%2==0?Colors.black: Colors.blue.shade900,fontWeight:FontWeight.w900)).toList())
                          ]) ),
                  Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      constraints: BoxConstraints(
                          maxHeight: double.infinity ),
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
                          children: getter2.map((e) => text(texts: e,color:getter2.indexOf(e)%2==0?Colors.black: Colors.blue.shade900,fontWeight:FontWeight.w900)
                          ).toList()
                          ) )
                ]  ))
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
    ));
  }
}