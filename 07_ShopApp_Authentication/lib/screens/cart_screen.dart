import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          //ElevatedButton(onPressed: null, child: Text('Hehe')),
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  OrderButton(cart: cart),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id,
              prodId: cart.items.keys.toList()[i],
              title: cart.items.values.toList()[i].title,
              price: cart.items.values.toList()[i].price,
              quantity: cart.items.values.toList()[i].quantity,
            ),
            itemCount: cart.itemCount,
          )),
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      child: _isLoading
          ? const CircularProgressIndicator()
          : const Text('Order Now'),
    );
  }
}