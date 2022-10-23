import 'package:flutter/material.dart';

class ReusableDrawerListTile extends StatelessWidget {
  const ReusableDrawerListTile({
    Key? key,
    required this.title,
    required this.onPress,
    required this.iconData,
    this.subtitle,
    this.subtitleColor,
    this.inDetails = false,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final IconData iconData;
  final String? subtitle;
  final Color? subtitleColor;
  final bool inDetails;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: const Color(0xffeaa504),
      ),
      onTap: onPress,
      subtitle: Text(
        subtitle ?? '',
        style: Theme.of(context).textTheme.caption!.copyWith(
          color: subtitleColor ?? Colors.grey[600],
          fontWeight: inDetails ? FontWeight.w800 :  FontWeight.w300,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: const Color(0xffeaa504),
            ),
      ),
    );
  }
}
