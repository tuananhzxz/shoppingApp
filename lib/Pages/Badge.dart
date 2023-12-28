import 'package:flutter/material.dart';
import 'package:shoppingapp/Class/cartItem.dart';
import 'package:shoppingapp/Pages/Checkout.dart';
import 'package:shoppingapp/Values/app_font.dart';

// ignore: must_be_immutable
class CartShop extends StatefulWidget {
  CartShop({super.key, required this.cartItems});
  final List<CartItem> cartItems;

  @override
  State<CartShop> createState() => _CartShopState();
}

class _CartShopState extends State<CartShop> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Cart",
            style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      ),
      backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              CartItem cart = cartItems[index];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(cart.shoes.image),
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 65,
                                        child: RichText(
                                          maxLines: 3,
                                          text: TextSpan(
                                            text: cart.shoes.title,
                                            style: MyFont.h5.copyWith(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "\$${cart.shoes.price}",
                                        style: MyFont.h5.copyWith(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartItems.removeAt(index);
                                            });
                                          },
                                          icon: const Icon(Icons.delete)),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (cart.quantity > 1) {
                                                  cart.quantity--;
                                                }
                                              });
                                            },
                                          ),
                                          Text(
                                            "${cart.quantity}",
                                            style: MyFont.h5,
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                if (cart.quantity < 20) {
                                                  cart.quantity++;
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "TOTAL",
                        style: MyFont.h5,
                      ),
                      Text(
                        "\$${totalCalculator()}",
                        style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (cartItems.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Checkout(),
                        ));
                  }
                },
                label: Text(
                  "Buy",
                  style: MyFont.h5,
                ),
                icon: const Icon(Icons.shopping_cart_checkout),
              )
            ],
          ),
        ),
      ),
    );
  }

  int totalCalculator() {
    int total = 0;
    for (CartItem cartItem in widget.cartItems) {
      total += cartItem.shoes.price * cartItem.quantity;
    }
    return total;
  }
}
