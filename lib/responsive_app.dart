import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
      ).copyWith(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ).copyWith(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      home: AdaptiveScaffold(
        internalAnimations: false,
        destinations: [
          NavigationDestination(icon: Icon(Icons.holiday_village), label: 'holiday'),
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.chair), label: 'chair'),
        ],
        onSelectedIndexChange: (index) => print('go router / navigator navigation should be placed here $index'),
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        smallBody: (context) => Text('smallBody'),
        body: (context) => AdaptiveLayout(
          internalAnimations: false,
          bodyRatio: 0.3,
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: Key('mediumBody'),
                builder: (context) => Text('mediumBody'),
              ),
              Breakpoints.largeAndUp: SlotLayout.from(
                key: Key('largeBody'),
                builder: (context) => Text('largeBody'),
              ),
            },
          ),
          secondaryBody: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.largeAndUp: SlotLayout.from(
                key: Key('largeSecondaryBody'),
                builder: (context) => Text('largeSecondaryBody'),
              ),
            },
          ),
        ),
        useDrawer: false,
      ),
    );
  }
}
