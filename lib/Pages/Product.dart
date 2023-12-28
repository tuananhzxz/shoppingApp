import 'package:flutter/material.dart';
import 'package:shoppingapp/Class/Shoes.dart';
import 'package:shoppingapp/Class/cartItem.dart';
import 'package:shoppingapp/Model/ShowDialog.dart';
import 'package:shoppingapp/Values/app_font.dart';

class productInfo extends StatefulWidget {
  const productInfo({super.key, required this.shoes});
  final Shoes shoes;

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {

  int total = 0;
  int quanti = 1;
  @override
  void initState() {
    total = widget.shoes.total ?? widget.shoes.price;
    quanti = widget.shoes.quanti ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 209, 252),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Padding(padding: EdgeInsets.only(right: 10)),
                    Text(
                      widget.shoes.title,
                      style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                              spreadRadius: 1)
                        ]),
                    child: Image(
                      image: AssetImage(widget.shoes.image),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    maxLines: null,
                                    text: TextSpan(
                                        text: widget.shoes.title,
                                        style: MyFont.h4.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16))),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 157, 209, 252),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 10,
                                                  spreadRadius: 1)
                                            ]),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (quanti > 1) {
                                                  quanti--;
                                                  total = widget.shoes.price *
                                                      quanti;
                                                  widget.shoes
                                                      .copyWith(quanti, total);
                                                }
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      quanti.toString(),
                                      style: MyFont.h4,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 157, 209, 252),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 10,
                                                  spreadRadius: 1)
                                            ]),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (quanti < 20) {
                                                  quanti++;
                                                  total = widget.shoes.price *
                                                      quanti;
                                                  widget.shoes
                                                      .copyWith(quanti, total);
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.add))),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: RichText(
                                maxLines: null,
                                text: TextSpan(
                                    text: widget.shoes.content,
                                    style: MyFont.h5.copyWith(fontSize: 17))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text("Storage : ${widget.shoes.quantity}",
                                style: MyFont.h5.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                        "\$$total",
                        style: MyFont.h4.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  CartItem cartItem = CartItem(widget.shoes, quanti);
                    cartItems.add(cartItem);
                  showMessage("Successfully!", context);
                },
                label: Text(
                  "Add to cart",
                  style: MyFont.h5,
                ),
                icon: const Icon(Icons.shopping_cart),
              )
            ],
          ),
        ),
      ),
    );
  }
}
