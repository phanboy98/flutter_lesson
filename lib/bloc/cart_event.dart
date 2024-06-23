import 'package:ec_app/models/cart_item.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItem item;

  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final String sku;

  RemoveFromCartEvent(this.sku);
}
