import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class custom extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
  void modalBottomSheetMenu(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (builder){
          return   Container(
                height: 150.0,
              decoration:  BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ Icon(Icons.wifi_off,size: 25),
              Text("Check Your Internet Connection",style: TextStyle(fontSize: 20,color:Colors.red ))]
                ));
        }
    );
    Future.delayed(Duration(seconds: 5),(){Navigator.pop(context);});
  }
  load(BuildContext context){
    Loader.show(context,overlayColor:Colors.black.withOpacity(0.5) ,
        progressIndicator: Center(
            child: CircularProgressIndicator(color:Colors.lightBlue)  ));
    Future.delayed(Duration(seconds: 5),(){Loader.hide();});
  }
}
