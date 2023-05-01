import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite-page';

  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
    );
  }
}
