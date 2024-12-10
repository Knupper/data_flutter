import 'package:flutter/material.dart';
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
      body: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProfileScaffold(
                id: index,
              ),
            ),
          ),
          child: PersonCard(
            id: index,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 28,
        ),
        itemCount: 1000,
      ),
    );
  }
}
