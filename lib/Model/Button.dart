import 'package:flutter/material.dart';
import 'package:shoppingapp/Values/app_font.dart';

class button extends StatelessWidget {
  const button({super.key, required this.label, required this.press});

  final String label;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),

      child: Container(
      width: size.width * 0.9,
       decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),

      child: TextButton(

        onPressed: press,
        child: Text(label, style: MyFont.h5.copyWith(
          color: Colors.white
        )),

      ),
      ),
    );

  }
}