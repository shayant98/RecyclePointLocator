import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';

class BaseLeafLayout extends StatelessWidget {
  final Widget child;

  const BaseLeafLayout({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [LeafClipper(), child],
    );
  }
}
