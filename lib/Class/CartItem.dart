import 'package:shoppingapp/Class/Shoes.dart';

class CartItem {
  final Shoes shoes;
  int quantity;


  CartItem(this.shoes, this.quantity);
}
    List<CartItem> cartItems = [];
