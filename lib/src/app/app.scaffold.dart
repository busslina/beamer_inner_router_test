import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class AppScaffold extends RearchConsumer {
  const AppScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    use.printConsumerLifecycle('AppScaffold');

    final currentScreen = use.lazyData<Screen>(() => const IndexScreen());

    final screen = currentScreen.value;

    // use.effect(
    //   () {
    //     if (screen.key is! GlobalKey) {
    //       throw ('Screen must have a GlobalKey -- ${screen.title}');
    //     }

    //     return null;
    //   },
    //   [currentScreen.value],
    // );

    // final screenRouterKey = use.lazyValue(() => GlobalKey());

    // print('screenRouterKey: $screenRouterKey');

    final screenRouter = use(screenRouterCapsule);

    use.effect(
      () {
        BeamLocation? prevLocation;
        RouteInformation? prevRouteInfo;

        void listener() {
          final location = screenRouter.currentBeamLocation;
          final routeInfo = location.state.routeInformation;

          print(
            'Screen router listener -- I -- ${location.state.routeInformation.uri.toString()} -- Same location: ${location == prevLocation} -- Same route info: ${routeInfo == prevRouteInfo}',
          );
          print(
            'Screen router listener -- II -- Prev route Info: ${prevRouteInfo?.uri.toString()}',
          );
          print(
            'Screen router listener -- III -- Route Info: ${routeInfo.uri.toString()}',
          );

          prevLocation = location;
          prevRouteInfo = routeInfo;
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
          buildHeader(screen),

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

  Widget buildFooter() => Container(
        color: Colors.yellow,
        constraints: const BoxConstraints(minHeight: 30),
      );
}
