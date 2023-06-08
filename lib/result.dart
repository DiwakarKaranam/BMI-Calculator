import 'package:flutter/material.dart';
class Result extends StatelessWidget {
   Result({Key? key,required this.a }) : super(key: key);
   String a;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(10),
          child: Center(
             child: Text(
                a,
                style: TextStyle(color: Colors.white,fontSize: 80,fontWeight: FontWeight.w900),
              ),
            ),
        ),
      ),
    );
  }
}
