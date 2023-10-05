import 'dart:async';
import 'package:flutter/foundation.dart';

import '../../home/models/home_product_data_modle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_easy_example/data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvents>(cartInitialEvents);
  }

  FutureOr<void> cartInitialEvents(CartInitialEvents event, Emitter<CartState> emit) {
     emit(CartLoadedSuccessState(cartItems: cartItems));
  }
}
