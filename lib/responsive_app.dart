import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_schulung/media_query_app.dart';

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
        body: (context) => AdaptiveLayout(
          internalAnimations: false,
          bodyRatio: 0.3,
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.smallAndUp: SlotLayout.from(
                key: Key('mediumBody'),
                builder: (context) => ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => AdaptiveCard(),
                  separatorBuilder: (context, index) => const Divider(),
                ),
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

class AdaptiveCard extends StatelessWidget {
  const AdaptiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallBreakpoint = context.isSmallBreakpoint;
    late Widget child;

    if (isSmallBreakpoint) {
      child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Placeholder(
            fallbackWidth: 200,
            fallbackHeight: 200,
            color: Colors.amber,
          ),
          Text('AdaptiveCard'),
          Flexible(child: Text('SuperLangerText' * 10)),
        ],
      );
    } else {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Placeholder(
            fallbackWidth: 200,
            fallbackHeight: 200,
            color: Colors.amber,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('AdaptiveCard'),
                Flexible(child: Text('SuperLangerText' * 10)),
              ],
            ),
          )
        ],
      );
    }

    return Container(
      color: Colors.greenAccent,
      child: child,
    );
  }
}
