import 'package:flutter/material.dart';



AppBar buildAppBar(BuildContext context, construct){
  return AppBar(
    leading: 
      const BackButton(
        color: Colors.black, 
      ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}



