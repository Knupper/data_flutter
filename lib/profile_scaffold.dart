import 'package:flutter/material.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile $id'),
      ),
      body: const Placeholder(),
    );
  }
}
