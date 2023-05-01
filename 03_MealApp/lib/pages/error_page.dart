import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found!'),
      ),
      body: const Center(
        child: Text('404! \n Page Not Found!', textAlign: TextAlign.center),
      ),
    );
  }
}
