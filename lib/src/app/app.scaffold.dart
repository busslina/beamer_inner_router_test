import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';

class AppScaffold extends RearchConsumer {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // ignore: avoid_print, unused_element
    void debug(String msg) => print('AppScaffold -- $msg');

    use.printConsumerLifecycle('AppScaffold');

    final screenRouter = use(screenRouterCapsule);
    final headerRouter = use(headerRouterCapsule);

    // final currentPath = use.lazyData(
    //   () => screenRouter.currentBeamLocation.state.routeInformation.uri.path,
    // );

    // use.effect(
    //   () {
    //     debug('Setting up router listener');

    //     void listener() {
    //       debug(
    //         'Router listener -- ${screenRouter.currentBeamLocation.state.routeInformation.uri.path}',
    //       );

    //       currentPath.value =
    //           screenRouter.currentBeamLocation.state.routeInformation.uri.path;
    //     }

    //     screenRouter.addListener(listener);

    //     return () => screenRouter.removeListener(listener);
    //   },
    //   [],
    // );

    return Scaffold(
      body: Column(
        children: [
          // Header
          Beamer(
            key: const Key('Header'),
            routerDelegate: headerRouter,
          ),

          // Screen router
          Expanded(
            key: const Key('Screen'),
            child: Beamer(
              routerDelegate: screenRouter,
            ),
          ),

          // Footer
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildFooter() => Container(
        color: Colors.yellow,
        constraints: const BoxConstraints(minHeight: 30),
      );
}
