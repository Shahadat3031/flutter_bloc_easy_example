import 'package:flutter/material.dart';
import 'package:flutter_bloc_easy_example/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_easy_example/features/home/models/home_product_data_modle.dart';


class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productDataModel.imageUrl),
                      fit: BoxFit.cover
                  )
              ),
            ),
            const SizedBox(height: 20,),
            Text(productDataModel.name,
              style: textTextStyle(),),
            Text(productDataModel.description),
            Row(
              children: [
                Text(productDataModel.price.toString(),style: textTextStyle()),
                const Spacer(),
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.favorite_border,), onPressed: () {
                   //   cartBloc.add(HomeProductWishlistButtonClickEvent(productDataModel));
                    }),
                    IconButton(icon: const Icon(Icons.shopping_bag_sharp), onPressed: () {
                  //    cartBloc.add(CartEve(productDataModel));
                      cartBloc.add(CartRemoveFromCart(productDataModel: productDataModel));
                    }),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textTextStyle() {
    return const TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  }
}
