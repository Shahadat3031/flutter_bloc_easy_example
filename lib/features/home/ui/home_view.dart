import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_easy_example/features/cart/ui/cart_view.dart';
import 'package:flutter_bloc_easy_example/features/home/ui/product_tile_widget.dart';
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
      buildWhen: (previous, current) => current is! HomeActionState,
      // getting my state and taking my action
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartView()));
        } else if(state is HomeProductStoreToCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item Cart")));
        }else if(state is HomeProductItemStoreToWishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item added to wishlist")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                actions: [
                  IconButton(icon: const Icon(Icons.favorite), onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  }),
                  IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  }),
                ],
                title: const Text('Grocery Home'),
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                return ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc,);
              }),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(child: Text('Error!!!'),),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
}
