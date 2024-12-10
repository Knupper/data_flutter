import 'package:flutter/material.dart';

class AdviceCard extends StatelessWidget {
  const AdviceCard({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
    );
  }
}
