import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod/controller/controller.dart';
import 'package:serverpod/view/view.dart';
import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:serverpod/view/custom.dart';
import 'package:serverpod/components/container.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
      home:  MyHomePage()    ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(child:
      Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
        ),
        body:Stack(children: [
          container(color: Colors.blue, opacity: 1,top: 0,left: -300,right: 0,height: 6,width: 6)   ,
          container(color: Colors.yellow, opacity: 0.8,top: 10,left: -120,right: 0,height: 8,width: 8)   ,
          container(color: Colors.red, opacity: 0.5,top: 50,left: 5,right: 5,height: 6,width: 6)   ,
          container(color: Colors.green, opacity: 1,top: -120,right: 0,height: 3,width: 3)   ,
          container(color: Colors.grey, opacity: 1,bottom:-150,left: -55,height: 2,width: 2)   ,
          container(color: Colors.black, opacity: 1,bottom:0,left: 0,height: 3,width: 3)   ,
          Center(child:
        Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('asset/download.png'),
              fit: BoxFit.fill
            )
          ))
        )]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:Consumer(builder: (BuildContext context, WidgetRef ref, Widget child) {
          final change=ref.watch(p);
          return  ElevatedButton(onPressed: () async {
            custom().load(context);
            final value=   await InternetConnectionChecker().connectionStatus;
            if(value==InternetConnectionStatus.connected)
            {       await   change.generate_user();
            Navigator.of(context).push(PageAnimationTransition(page: ProviderScope(child: view(user:change.generated_user)),
                pageAnimationType:BottomToTopTransition() ));}
            else  {custom().modalBottomSheetMenu(context);}
          }, style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue.shade800,
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              minimumSize: Size(MediaQuery.of(context).size.width-50 ,50)),
              child: const Text('Generate User',style: TextStyle(fontSize: 25)));
        })
      ));
  }
}