import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/widgets/product_grid.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/widgets/badge.dart' as bd;

enum FilterOptions {
  // ignore: constant_identifier_names
  Favorites,
  // ignore: constant_identifier_names
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  showFavoriteOnly = true;
                } else {
                  showFavoriteOnly = false;
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Only Favorite'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show All'),
              )
            ],
            icon: const Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (ctx, cartData, ch) => bd.Badge(
              value: cartData.itemCount.toString(),
              color: Colors.pink,
              child: ch as Widget,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            //child: IconButton(onPressed: , icon: icon),
          )
        ],
      ),
      body: ProductGrid(showFavoriteOnly),
    );
  }
}
