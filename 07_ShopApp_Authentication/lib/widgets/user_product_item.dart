import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final scaffoldMsg = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  //print(error.toString());
                  scaffoldMsg.hideCurrentSnackBar();
                  scaffoldMsg.showSnackBar(
                    const SnackBar(
                      content:
                          Text('Deleting failed', textAlign: TextAlign.center),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.black54,
                    ),
                  );
                }
              },
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
