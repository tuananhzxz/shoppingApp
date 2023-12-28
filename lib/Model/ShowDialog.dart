import 'package:flutter/material.dart';


void showMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    
    content: Text(message),
    backgroundColor: Colors.blue,
    action: SnackBarAction(
      onPressed: (){},
      label: "Done",
      textColor: Colors.white,
    ),
  )
  );
}