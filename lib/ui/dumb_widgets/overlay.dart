import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';

class Overlay extends StatelessWidget {
  final void Function() onTap;

  const Overlay({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        color: Colors.black.withOpacity(0.8),
      ),
    );
  }
}
