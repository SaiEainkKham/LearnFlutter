import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider(create: (_) => Products()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => Orders()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          //initialRoute: '/',
          theme: ThemeData(
            fontFamily: 'Lato',
            //primarySwatch: Colors.purple,
            iconTheme: const IconThemeData(color: Colors.orange),
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.purple,
              onPrimary: Colors.white,
              secondary: Colors.orange,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.blue,
              onBackground: Colors.white,
              surface: Colors.grey,
              onSurface: Colors.black26,
            ),
            textTheme: TextTheme(
              displaySmall: TextStyle(
                fontFamily: 'Lato',
                fontSize: 14,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          home:
              auth.isAuth ? const ProductOverviewScreen() : const AuthScreen(),
          routes: {
            //'/': (context) => const AuthScreen(),
            ProductOverviewScreen.routeName: (context) =>
                const ProductOverviewScreen(),
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrderScreen.routeName: (context) => const OrderScreen(),
            UserProductScreen.routeName: (context) => const UserProductScreen(),
            EditProductScreen.routeName: (context) => const EditProductScreen(),
            AuthScreen.routeName: (context) => const AuthScreen(),
          },
        ),
      ),
    );
  }
}
