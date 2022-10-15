import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.title, required this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: const Color(0xff496A72),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
