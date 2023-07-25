import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/auth.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   super.key,
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final scaffoldMsg = ScaffoldMessenger.of(context);
    final product = Provider.of<Product>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () async {
                try {
                  await product.toggleFavoriteStatus(
                      authData.token as String, authData.userId as String);
                } catch (error) {
                  scaffoldMsg.hideCurrentSnackBar();
                  scaffoldMsg.showSnackBar(
                    const SnackBar(
                      content:
                          Text('Action Failed', textAlign: TextAlign.center),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.black54,
                    ),
                  );
                }
                //print('${product.isFavorite}');
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {
                cartData.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.black54,
                    content: const Text('Add Item to Cart'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cartData.removeSingleItem(product.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          ),
          child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/product-placeholder.png'),
            image: NetworkImage(
              product.imageUrl,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
