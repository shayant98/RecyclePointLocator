import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';

class FloatingContainer extends StatelessWidget {
  final Widget child;

  const FloatingContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kShadow.withOpacity(0.5), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 4, // blur radius
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
