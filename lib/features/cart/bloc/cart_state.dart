part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState {}

class CartLoadingState extends CartEvent{}

class CartLoadedSuccessState extends CartState{
  final List<ProductDataModel> cartItems;

  CartLoadedSuccessState({required this.cartItems});
}
