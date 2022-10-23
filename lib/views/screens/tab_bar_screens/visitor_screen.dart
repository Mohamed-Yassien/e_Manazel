import 'package:flutter/material.dart';

class VisitorScreen extends StatelessWidget {
  const VisitorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Visitor'),
      ),
    );
  }
}
