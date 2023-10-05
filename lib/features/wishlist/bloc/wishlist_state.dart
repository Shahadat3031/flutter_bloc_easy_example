part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistInitialState extends WishlistState{}

class WishlistLoadedSuccessfully extends WishlistState{
  final ProductDataModel wishlistItems;

  WishlistLoadedSuccessfully({required this.wishlistItems});
}
