import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.width,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: MaterialButton(
        onPressed: onPress,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        color: const Color(0xffeaa504),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
