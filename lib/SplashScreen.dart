import 'package:flutter/material.dart';
import 'package:galaxy/Click.dart';
import 'package:galaxy/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin{
late AnimationController animationController;
  @override
  void initState(){
    Future.delayed(Duration(seconds: 5)).then((value){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Click()));
    });
    super.initState();
    animationController=AnimationController(vsync: this,
    duration: Duration(milliseconds: 5000),);
    animationController.forward();
    animationController.addListener(() {setState(() {
      if (
      animationController.status==AnimationStatus.completed
      ){
    animationController.repeat();
      }
    });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
     body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/cloud.jpg"), fit: BoxFit.cover),
          ),
    child: AnimatedBuilder(
    animation: animationController,
    builder: (BuildContext context, child) {
    return Transform.rotate(angle: animationController.value,child:Center(
    child: Image(image: AssetImage('assets/full.png'),height: 130,width: 130,
    ),)
    );
    },
         /* child: Center(
              child: Image(image: AssetImage('assets/full.png'),height: 130,width: 130,
              )),*/
      ),
     ) );
  }
}
