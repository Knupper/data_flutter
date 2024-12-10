import 'package:flutter/material.dart';
import 'package:flutter_schulung/presentation/pages/advice/advice_page.dart';
import 'package:flutter_schulung/widget/add_profile_scaffold.dart';
import 'package:flutter_schulung/widget/profile_scaffold.dart';
import 'package:flutter_schulung/widget/task_2.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddProfileScaffold(),
          ),
        ),
      ),
      body: AdvicePageWrapper(),
    );
  }
}
