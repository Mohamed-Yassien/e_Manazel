import 'package:e_manazel/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    Assets.imagesLogo,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color(0xffeaa504),
                        ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xffeaa504),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'Home Screen',
        ),
      ),
    );
  }
}
