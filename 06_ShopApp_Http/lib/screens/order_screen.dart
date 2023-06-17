import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreens extends StatefulWidget {
  static const routeName = '/orders';
  const OrderScreens({super.key});

  @override
  State<OrderScreens> createState() => _OrderScreensState();
}

class _OrderScreensState extends State<OrderScreens> {
  var _isloading = false;

  @override
  void initState() {
    setState(() {
      _isloading = true;
    });
    Provider.of<Orders>(context, listen: false).fetchOrder().then(
      (_) {
        setState(() {
          _isloading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      drawer: const AppDrawer(),
      body: _isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(order: orderData.orders[i]),
              itemCount: orderData.orders.length,
            ),
    );
  }
}
