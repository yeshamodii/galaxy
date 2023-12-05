import 'package:flutter/material.dart';
import 'package:galaxy/Model.dart';
import 'package:galaxy/Providerclass.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {


  const DetailsPage({super.key, required this.model});
  final Model model;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with TickerProviderStateMixin{
  late  AnimationController rotationController;
  @override
  void initState() {

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    final curvedAnimation = CurvedAnimation(
      parent: rotationController,
      curve: Curves.fastOutSlowIn,
    );
    rotationController.repeat();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/originals/a9/b7/a9/a9b7a9fbdce9a3d0a89fed3f74c33a2a.jpg'),fit: BoxFit.cover
              )
            ),
          ),SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade300.withOpacity(
                              (Provider.of<ThemeProvider>(context).isDark) ? 0.1 : 0.90),
                          width: 0.8,
                        ),
                      ),
                      child: Text(
                        widget.model.name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                ),
                SizedBox(height: 15),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                  child: Center(
                    child: Container(
                      height: 280,
                      width: 280,
                      child: Image.network(
                        widget.model.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.only(left: 20,right: 250),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade500.withOpacity(
                            (Provider.of<ThemeProvider>(context).isDark) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Position:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(width: 8,),
                        Text(widget.model.position,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                      ],
                    )
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.only(left: 20,right: 240),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade500.withOpacity(
                            (Provider.of<ThemeProvider>(context).isDark) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Velocity:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(width: 6,),
                        Text(widget.model.velocity,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                      ],
                    )
                ),
                SizedBox(height: 15),
                Container(
                    margin: EdgeInsets.only(left: 20,right: 220),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade500.withOpacity(
                            (Provider.of<ThemeProvider>(context).isDark) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text('Distance:-',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(width: 8,),
                        Text(widget.model.distance,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                      ],
                    )
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade500.withOpacity(
                            (Provider.of<ThemeProvider>(context).isDark) ? 0.1 : 0.90),
                        width: 0.8,
                      ),
                    ),
                    child: Text(widget.model.description),
                  ),
                )
              ]
          ),
        ),
    ]
      ),
    );
  }
}
