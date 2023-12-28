import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/Class/Shoes.dart';
import 'package:shoppingapp/Class/cartItem.dart';
import 'package:shoppingapp/Model/TextField.dart';
import 'package:shoppingapp/Pages/Badge.dart';
import 'package:shoppingapp/Pages/GridItem.dart';
import 'package:shoppingapp/Values/app_font.dart';

class HomeApp extends StatefulWidget {
  HomeApp({super.key});
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.sort,
                      size: 30,
                    ),
                    const Padding(padding: EdgeInsets.only(left: 30)),
                    Text(
                      "SHOES APP",
                      style: MyFont.h4,
                    ),
                    const Spacer(),
                    Badge(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartShop(
                                  cartItems: cartItems,
                                ),
                              ));
                        },
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 195, 228, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Find Your",
                          style: MyFont.h3,
                        ),
                        Text(
                          "Shoes Now",
                          style: MyFont.h2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textField(
                          icon: Icons.search,
                          text: "Search you looking for",
                          showPass: false,
                          textEditingController: search,
                          onChange: searchShoes,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Hot Product",
                        style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [ItemGrid()],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartShop(
                          cartItems: cartItems,
                        )));
          }
        },
        items: const [Icon(Icons.home), Icon(Icons.shopping_cart)],
      ),
    );
  }

  void searchShoes(String searchText) async {
    setState(() {
      productCarts = productShoes
          .where((shoes) =>
              shoes.title.toLowerCase().contains(searchText.toLowerCase()) ||
              shoes.content.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }
}
