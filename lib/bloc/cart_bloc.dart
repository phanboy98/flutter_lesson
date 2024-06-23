import 'package:ec_app/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ec_app/bloc/cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddToCartEvent>((event, emit) {
      emit(state.add(event.item));
    });

    on<RemoveFromCartEvent>((event, emit) {
      emit(state.remove(event.sku));
    });
  }
}
