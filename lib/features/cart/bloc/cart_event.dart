part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvents extends CartEvent{}

class CartRemoveFromCart extends CartEvent{

}

class CartSuccessLoadedEvent extends CartEvent{
  final ProductDataModel cartItems;

  CartSuccessLoadedEvent({required this.cartItems});
}