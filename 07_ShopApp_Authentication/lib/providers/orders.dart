import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String authToken;

  Orders(this.authToken, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchOrder() async {
    final url =
        'https://fir-shop-app-aedd8-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken';

    final response = await http.get(Uri.parse(url));
    //print(response.body);
    if (json.decode(response.body) == null) {
      return;
    }

    final extractData = json.decode(response.body) as Map<String, dynamic>;
    final List<OrderItem> loadedOrders = [];

    extractData.forEach((key, loadedProduct) {
      loadedOrders.add(OrderItem(
        id: key,
        amount: loadedProduct['amount'],
        products: (loadedProduct['products'] as List<dynamic>)
            .map((item) => CartItem(
                  id: item['id'],
                  title: item['title'],
                  price: item['price'],
                  quantity: item['quantity'],
                ))
            .toList(),
        dateTime: DateTime.parse(loadedProduct['dateTime']),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final time = DateTime.now();
    final url =
        'https://fir-shop-app-aedd8-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'amount': total,
        'dateTime': time.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'price': cp.price,
                  'quantity': cp.quantity,
                })
            .toList(),
      }),
    );
    _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: cartProducts,
          dateTime: time,
        ));
    notifyListeners();
  }
}
