import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:galaxy/DetailsPage.dart';
import 'package:galaxy/Model.dart';
import 'package:galaxy/Click.dart';
import 'package:galaxy/Providerclass.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
List<Model>bookmark=[];

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Provider.of<ThemeProvider>(context,listen: false).ChangeTheme();
          }, icon: Provider.of<ThemeProvider>(context).isDark?
          Icon(Icons.dark_mode_outlined)
          :Icon(Icons.light_mode_outlined)),
          IconButton(onPressed: (){
            _showBookmarks(context);
          }, icon: Icon(Icons.favorite))
        ],
      ),
      body: Stack(
        children:[ Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://media.istockphoto.com/id/1323821548/vector/night-starry-sky-and-milky-way.jpg?s=612x612&w=0&k=20&c=JG7SoN4KI8yLBTJl0n-mr7vTK-GH5KbmkTVqHHd0r3Q=',),fit: BoxFit.cover
            ),
          )
        )
          ,AnimationLimiter(
            child:  ListView.builder(
          padding: EdgeInsets.all(30),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: modelList.length,
            itemBuilder: (context, index) {
              Model model = modelList[index];
              bool isBookmarked = bookmark.contains(model);
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 300),
                child: FadeInAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 2500),
                  child: InkWell(
                    onTap: () {
                      print('Tapped on ${model.name}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(model : model),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(
                          Provider.of<ThemeProvider>(context).isDark ? 0.1 : 0.90,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(image: NetworkImage(model.image)),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  model.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isBookmarked) {
                                        bookmark.remove(model);
                                      } else {
                                        bookmark.add(model);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isBookmarked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isBookmarked ? Colors.red : null,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          ),
    ]
      ),
    );
  }
}

void _showBookmarks(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text('Bookmark Items'),
      content: Column(
        children: [
          for(Model bookmark in bookmark)
            ListTile(
              title: Text(bookmark.name),
            )
        ],
      ),
    );
  });
}