import 'package:flutter/material.dart';
import 'package:shoppingapp/Class/Shoes.dart';
import 'package:shoppingapp/Class/cartItem.dart';
import 'package:shoppingapp/Model/ShowDialog.dart';
import 'package:shoppingapp/Pages/Product.dart';
import 'package:shoppingapp/Values/app_font.dart';

class ItemGrid extends StatefulWidget {
  const ItemGrid({super.key});

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  @override
  void initState() {
    setState(() {
      productCarts = productShoes;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
      ),
      itemCount: productCarts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Shoes shoes = productCarts[index];
        return Container(
          padding: const EdgeInsets.only(top: 6, left: 15, right: 15),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "NEW",
                        style: MyFont.h5
                            .copyWith(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => productInfo(
                                shoes: shoes,
                              )));
                },
                child: Image.asset(
                  shoes.image,
                  width: 130,
                  height: 111,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: RichText(
                  maxLines: 1,
                  text: TextSpan(
                    text: shoes.title,
                    style: MyFont.h5.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                      text: shoes.content,
                      style: MyFont.h5.copyWith(fontSize: 13)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${shoes.price}",
                    style: MyFont.h5.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        CartItem cartItem = CartItem(shoes, 1);
                        cartItems.add(cartItem);
                        showMessage("Successfully", context);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 20,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
