import 'package:flutter/material.dart';
import 'package:flutter_bloc_easy_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_easy_example/features/cart/ui/cart_tile_widget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadedSuccessState:
              final successState = state as CartLoadedSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc,
                    );
                  });
            default:
          }
          return Container();
        },
      ),
    );
  }
}
