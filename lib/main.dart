import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:neumor/box.dart';
import 'drawer.dart';
import 'button.dart';
import 'package:swipedetector/swipedetector.dart';

//import 'drawer.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;
  List quotes = [
    {"name": "Happy", "imageUrl": "assets/happy.png"},
    {"name": "Sad", "imageUrl": "assets/sad.png"},
    {"name": "Angry", "imageUrl": "assets/anger.png"},
    {"name": "Alone", "imageUrl": "assets/alone.png"},
    {"name": "Success", "imageUrl": "assets/success.png"},
    {"name": "Love", "imageUrl": "assets/love.png"},
    {"name": "Positive", "imageUrl": "assets/positive.png"},
    {"name": "Family", "imageUrl": "assets/family.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SwipeDetector(
        onSwipeRight: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_OPEN;
          });
        },
        onSwipeLeft: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_CLOSE;
          });
        },
        child: FoldableSidebarBuilder(
          drawerBackgroundColor: backgroundColor,
          drawer: FoldedDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    NMButton(
                      icon: Icons.menu,
                      lol: () {
                        setState(() {
                          drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                              ? FSBStatus.FSB_CLOSE
                              : FSBStatus.FSB_OPEN;
                        });
                      },
                    ),
                    NMButton(
                      icon: Icons.info,
                      lol: () {},
                    )
                  ],
                ),
                SizedBox(height: 5),
                Text("Mero Quotes",
                    style: TextStyle(
                        color: tColor,
                        fontSize: 30,
                        shadows: <Shadow>[
                          Shadow(
                              offset: Offset(3, 3),
                              blurRadius: 4,
                              color: shadowColor)
                        ])),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: quotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: InkWell(
                              onTap: () {},
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      height: 110,
                                      width: 110,
                                      padding: EdgeInsets.all(8),
                                      decoration: boxDInvert,
                                      child: Container(
                                          child: Center(
                                              child: new Image.asset(
                                                  quotes[index]["imageUrl"],
                                                  width: 60.0,
                                                  height: 60.0)))
                                      // child: Container(

                                      //  child: Image.asset(

                                      //     quotes[index]["imageUrl"],
                                      //     height: 50,
                                      //     width: 50,),
                                      //     // decoration: BoxDecoration(
                                      //     //     image: new DecorationImage(

                                      //     //         image: new AssetImage(
                                      //     //             quotes[index]["imageUrl"]))
                                      //     //            )
                                      //                 ),
                                      ),
                                  SizedBox(height: 8),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: boxDInvert,
                                    alignment: Alignment.center,
                                    child: Text(quotes[index]["name"],
                                        style: TextStyle(
                                          color: tColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )),
                                  )
                                ],
                              )));
                    },
                  ),
                )
              ],
            ),
          ),
          status: drawerStatus,
        ),
      ),
    ));
  }
}
