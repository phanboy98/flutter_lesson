import 'package:ec_app/models/cart_item.dart';

class CartState {
  final List<CartItem> cart;
  CartState(this.cart);

  CartState add(CartItem item) {
    if (cart.any((element) => element.sku == item.sku)) {
      return CartState(cart
          .map((element) => element.sku == item.sku
              ? CartItem(
                  sku: element.sku,
                  name: element.name,
                  price: element.price,
                  img: element.img,
                  quantity: element.quantity + 1)
              : element)
          .toList());
    } else {
      return CartState([...cart, item]);
    }
  }

  CartState remove(String sku) {
    return CartState(cart.where((element) => element.sku != sku).toList());
  }

  int get total =>
      cart.fold(0, (previousValue, element) => previousValue + element.price);

  int get qty => cart.length;
}
