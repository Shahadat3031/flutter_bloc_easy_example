import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_easy_example/data/cart_items.dart';
import 'package:flutter_bloc_easy_example/data/grocery_data.dart';
import 'package:flutter_bloc_easy_example/data/wishlist_items.dart';
import 'package:flutter_bloc_easy_example/features/home/models/home_product_data_modle.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //on This event <Event> pass this (State)state
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent); // Action
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent); // Action
    on<HomeProductWishlistButtonClickEvent>(homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    //first method
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    try{
      emit(HomeLoadedSuccessState(GroceryData.groceryProducts.map((e) =>
          ProductDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl'])).toList()));
    } catch(e){
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigate to Wishlist Screen");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigate to Cart Screen");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    print("Wishlist button Clicked");
    wishListItems.add(event.productDataModel);
    emit(HomeProductItemStoreToWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    print("Cart button Clicked ");
    cartItems.add(event.productDataModel);
    emit(HomeProductStoreToCartActionState());

  }
}
