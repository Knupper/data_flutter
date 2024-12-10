import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:flutter_schulung/domain/use_cases/advice_use_case.dart';
import 'package:flutter_schulung/presentation/pages/advice/cubit/advice_cubit.dart';
import 'package:flutter_schulung/presentation/pages/advice/widgets/advice_card.dart';

class AdvicePageWrapper extends StatelessWidget {
  const AdvicePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdviceCubit>(
      create: (context) => AdviceCubit(
        useCase: AdviceUseCase(repository: RepositoryProvider.of<AdviceRepo>(context)),
      ),
      child: AdvicePage(),
    );
  }
}

// Aufgabe 4:
// Erweitere das unten stehende Programm um ein Eingabefeld
// Dieses Feld soll nur Ziffern erlauben
// Wenn der Nuzter eine Zahl eingegeben hat, wird der entsprechende Advice abgerufen
// Ist keine Zahl vorhanden, wird ein beliebiger Advice abgerufen
// Der Advice wird erst beim Button Klick abgerufen
class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlocBuilder<AdviceCubit, AdviceState>(
            builder: (context, state) {
              late Widget child;
              switch (state) {
                case AdviceEmptyState():
                  child = Text('Bitte rufe erst Daten ab');
                case AdviceLoadingState():
                  child = CircularProgressIndicator();
                case AdviceLoadedState():
                  child = Text(state.text);
                case AdviceErrorState():
                  child = Text('ERROR');
              }

              return AdviceCard(child: child);
            },
          ),
          ElevatedButton(
            onPressed: BlocProvider.of<AdviceCubit>(context).getAdvice,
            // onPressed: context.read<AdviceCubit>().getAdvice,
            child: Text('Fetch'),
          ),
        ],
      ),
    );
  }
}
