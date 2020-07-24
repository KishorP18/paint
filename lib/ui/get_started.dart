import 'package:flutter/material.dart';

import '../routes.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Text("Welcome to Paint.",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
        SizedBox(height: 12.0,),
        Text("Write notes and paint in this amzing application",
          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
        SizedBox(
          height: 20.0,
        ),

       RaisedButton(
           child:  Text("Get Started"),
           onPressed:()=>Navigator.pushNamed(context, Routes.paintWidget))
       ],
      ),
    );
  }
}
