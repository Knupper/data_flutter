import 'package:flutter/material.dart';

// Aufgabe 3:
// Ergänze folgende Felder:
// Nachname: Pflichtfeld, darf nicht leer sein
// Email: Optional, wenn gefüllt, muss es eine valide mail sein
// Phone: Optional, darf nur aus Ziffern bestehen
class AddProfileScaffold extends StatefulWidget {
  const AddProfileScaffold({super.key});

  @override
  State<AddProfileScaffold> createState() => _AddProfileScaffoldState();
}

class _AddProfileScaffoldState extends State<AddProfileScaffold> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add profile'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUnfocus,
              decoration: const InputDecoration(
                labelText: 'Vorname',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Bitte gebe einen Vornamen ein.';
                }

                final bool isEmailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

                if (!isEmailValid) {
                  return 'keine valide mail adresse';
                }
                return null;
              },
            ),
            OutlinedButton(
              onPressed: () => _formKey.currentState?.validate(),
              child: const Text('speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
