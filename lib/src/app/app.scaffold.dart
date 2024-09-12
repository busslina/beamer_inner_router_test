import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class AppScaffold extends RearchConsumer {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // ignore: avoid_print
    void debug(String msg) => print('AppScaffold -- $msg');

    use.printConsumerLifecycle('AppScaffold');

    final screenRouter = use(screenRouterCapsule);

    final currentPath = use.lazyData(
      () => screenRouter.currentBeamLocation.state.routeInformation.uri.path,
    );

    final headerSubtitle = use.memo(
      () => getScreenHeaderSubtitle(currentPath.value),
      [currentPath.value],
    );

    use.effect(
      () {
        debug('Setting up router listener');

        void listener() {
          debug(
            'Router listener -- ${screenRouter.currentBeamLocation.state.routeInformation.uri.path}',
          );
        }

        screenRouter.addListener(listener);

        return () => screenRouter.removeListener(listener);
      },
      [],
    );

    return Scaffold(
      body: Column(
        children: [
          // Header
          buildHeader(subtitle: headerSubtitle),

          // Screen router
          Expanded(
            child: Beamer(
              // key: screenRouterKey,
              routerDelegate: screenRouter,
            ),
          ),

          // Footer
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildHeader({required String? subtitle}) => Container(
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
            if (subtitle != null)
              Text(
                subtitle,
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      );

  Widget buildFooter() => Container(
        color: Colors.yellow,
        constraints: const BoxConstraints(minHeight: 30),
      );
}
