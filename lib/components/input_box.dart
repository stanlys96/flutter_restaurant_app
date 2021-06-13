import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  String title;
  Icon icon;
  Function changeVal;
  InputBox({required this.title, required this.icon, required this.changeVal});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 16.0,
          bottom: 5.0,
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(246, 247, 249, 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromRGBO(145, 160, 196, 1),
                    fontSize: 15.0,
                  ),
                ),
                Container(
                  width: 305.0,
                  child: TextFormField(
                    style: TextStyle(
                      color: Color.fromRGBO(16, 46, 129, 1),
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                    ),
                    onChanged: (val) {
                      changeVal(title, val);
                    },
                  ),
                ),
              ],
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
