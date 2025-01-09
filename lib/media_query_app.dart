import 'package:flutter/material.dart';

class MediaQueryApp extends StatelessWidget {
  const MediaQueryApp({super.key});

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
      home: Scaffold(
        body: SizedBox(
          height: 200,
          width: 200,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = MediaQuery.sizeOf(context);
              final breakpoint = context.displayBreakpoint;
              context.isLargeBreakpoint;
              context.isSmallBreakpoint;

              // DO not use : final size = MediaQuery.of(context).size;
              // print('size: $size');
              print('size of parent widget $constraints');
              return Container(
                child: Text('size of app: $size'),
              );
            },
          ),
        ),
      ),
    );
  }
}

extension BreakpointExtension on BuildContext {
  bool get isSmallBreakpoint => MediaQuery.sizeOf(this).width < 600;

  bool get isMediumBreakpoint => MediaQuery.sizeOf(this).width < 1200;

  bool get isLargeBreakpoint => !isSmallBreakpoint && !isMediumBreakpoint;

  DisplayBreakpoint get displayBreakpoint {
    if (isSmallBreakpoint) {
      return DisplayBreakpoint.small;
    } else if (isMediumBreakpoint) {
      return DisplayBreakpoint.medium;
    } else {
      return DisplayBreakpoint.large;
    }
  }
}

enum DisplayBreakpoint { small, medium, large }
