part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickEvent extends HomeEvent{
  final ProductDataModel productDataModel;

  HomeProductWishlistButtonClickEvent(this.productDataModel);
}

class HomeProductCartButtonClickEvent extends HomeEvent{
  final ProductDataModel productDataModel;

  HomeProductCartButtonClickEvent(this.productDataModel);

}

//Navigate Events
class HomeWishlistButtonNavigateEvent extends HomeEvent{}

class HomeCartButtonNavigateEvent extends HomeEvent{}




