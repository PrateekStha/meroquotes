import 'package:flutter/material.dart';
import 'box.dart';
class NMButton extends StatefulWidget {
  final IconData icon;
  final Function lol;
  NMButton({this.icon, this.lol});
  @override
  _NMButtonState createState() => _NMButtonState();
}

class _NMButtonState extends State<NMButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55,
        height: 55,
        decoration: nMboxbutton,
        child: IconButton(
            icon: Icon(
              widget.icon,
              color: tColor,
            ),
            onPressed: () {
              setState(() {
                widget.lol();
              }
               );
              print('pressed');
            }));
  }
}

