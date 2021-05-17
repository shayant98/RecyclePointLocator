import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';

class TransparentButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const TransparentButton({Key? key, required this.onPressed, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.only(top: paddingSmall, bottom: paddingSmall, left: paddingRegular),
      onPressed: onPressed,
      child: child,
    );
  }
}
