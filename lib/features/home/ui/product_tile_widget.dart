import 'package:flutter/material.dart';
import 'package:flutter_bloc_easy_example/features/home/models/home_product_data_modle.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

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
              Text(productDataModel.description, style: textTextStyle(),),
              Row(
                children: [
                  Text("Product Price ${productDataModel.price}",style: textTextStyle()),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.favorite_border,), onPressed: () {
                         homeBloc.add(HomeProductWishlistButtonClickEvent());
                      }),
                      IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickEvent());
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
