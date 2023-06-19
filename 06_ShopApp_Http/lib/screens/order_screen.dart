import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

/*
class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreensState();
}

class _OrderScreenState extends State<OrderScreens> {
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
*/

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Order'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false).fetchOrder(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                // Do Error Handling
                return const Center(
                  child: Text('An Error Occured'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemBuilder: (ctx, i) =>
                        OrderItem(order: orderData.orders[i]),
                    itemCount: orderData.orders.length,
                  ),
                );
              }
            }
          },
        ));
  }
}
