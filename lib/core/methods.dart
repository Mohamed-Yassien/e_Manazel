import 'package:e_manazel/core/routes/route_with_animation.dart';
import 'package:flutter/material.dart';

void navigateToAndFinish({
  required Widget widget,
  required context,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    RouteWithAnimation(
      screen: widget,
    ),
    (route) => false,
  );
}

void navigateTo({
  required Widget widget,
  required context,
}) {
  Navigator.push(
    context,
    RouteWithAnimation(
      screen: widget,
    ),
  );
}
