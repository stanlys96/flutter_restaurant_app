import 'package:flutter/material.dart';

class TypeBox extends StatelessWidget {
  String title;
  Function changeState;
  Color color;
  Color fontColor;
  TypeBox(
      {required this.title,
      required this.changeState,
      required this.color,
      required this.fontColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeState(title);
      },
      child: Container(
        width: 120.0,
        height: 35.0,
        margin: EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
          left: 12.0,
          right: 8.0,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: fontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
