import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/providers/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (content) => Products()),
        ChangeNotifierProvider(create: (content) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        //home: ProductOverviewScreen(),
        initialRoute: '/',
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
            onSurface: Colors.white,
          ),
          textTheme: TextTheme(
            displaySmall: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        routes: {
          '/': (context) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
        },
      ),
    );
  }
}
