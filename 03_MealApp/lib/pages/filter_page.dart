import 'package:flutter/material.dart';

class FilteredPage extends StatelessWidget {
  static const routeName = '/filter-page';
  const FilteredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
    );
  }
}
