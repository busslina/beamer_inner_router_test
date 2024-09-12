import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class AppScaffold extends RearchConsumer {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final currentScreen = use.lazyData<Screen>(() => IndexScreen());

    final screen = currentScreen.value;

    use.effect(
      () {
        if (screen.key is! GlobalKey) {
          throw ('Screen must have a GlobalKey -- ${screen.title}');
        }

        return null;
      },
      [currentScreen.value],
    );

    return Scaffold(
      // body: Center(child: Text('App Scaffold')),
      body: Column(
        children: [
          // Header
          buildHeader(screen),

          // Screen
          buildScreen(screen),

          // Footer
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildHeader(Screen currentScreen) => Container(
        color: Colors.grey,
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            const Text(
              appTitle,
              style: TextStyle(fontSize: 28),
            ),

            // Subtitle
            Text(
              currentScreen.title,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      );

  Widget buildScreen(Screen currentScreen) => Expanded(
        child: Container(
          color: Colors.purple,
          child: currentScreen,
        ),
      );

  Widget buildFooter() => Container(
        color: Colors.yellow,
        constraints: const BoxConstraints(minHeight: 30),
      );
}
