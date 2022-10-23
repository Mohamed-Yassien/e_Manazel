import 'package:flutter/material.dart';

class PhoneBookScreen extends StatelessWidget {
  const PhoneBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('PhoneBook'),
      ),
    );
  }
}
