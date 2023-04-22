import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item'),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('This is item page'),
      ),
    );
  }
}
