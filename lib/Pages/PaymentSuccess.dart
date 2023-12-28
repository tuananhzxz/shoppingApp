import 'package:flutter/material.dart';
import 'package:shoppingapp/Class/cartItem.dart';
import 'package:shoppingapp/Model/Button.dart';
import 'package:shoppingapp/Model/ShowDialog.dart';
import 'package:shoppingapp/Pages/HomeApp.dart';
import 'package:shoppingapp/Values/app_font.dart';

class OderSuccess extends StatelessWidget {
  OderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oder Successful!",
              style: MyFont.h2,
            ),
            button(
              label: "CONTINUE",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeApp()));
                cartItems.clear();
                showMessage("Thanks You So Much", context);
              },
            ),
          ],
        ),
      )),
    );
  }
}
