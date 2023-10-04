import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_easy_example/features/cart/ui/cart_view.dart';
import 'package:flutter_bloc_easy_example/features/wishlist/ui/wishlist_view.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      // getting my state and taking my action
      listener: (context, state) {
        if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
        } else if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartView()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(icon: const Icon(Icons.favorite), onPressed: (){
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              }),
              IconButton(icon: const Icon(Icons.shopping_cart), onPressed: (){
                homeBloc.add(HomeCartButtonNavigateEvent());
              }),
            ],
            title: const Text('Grocery Home'),
          ),
        );
      },
    );
  }
}
