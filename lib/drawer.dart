
import 'package:flutter/material.dart';
import 'profile.dart';
class FoldedDrawer extends StatelessWidget {

  final Function closeDrawer;

  const FoldedDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
       color: Colors.white,
      width: mediaQuery.size.width * 0.6,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              //color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Mero Quotes")
                ],
              )),
          ListTile(
            onTap: (){
              print(" Profile");
              Navigator.push(context,MaterialPageRoute(builder:(context)=>ProfileSection()));
              closeDrawer();
            },
            leading: Icon(Icons.person),
            title: Text(
              "Profile",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              print(" home");
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
  
}

