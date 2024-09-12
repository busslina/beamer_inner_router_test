import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

/// Root router.
BeamerDelegate appRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (_, __, ___) => const AppScaffold(),
      },
    ).call,
  );
}

BeamerParser appRouterParserCapsule(CapsuleHandle use) => BeamerParser();

/// Screen router.
BeamerDelegate screenRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        Routes.index: (context, state, data) => IndexScreen(),
        Routes.settings: (context, state, data) => SettingsScreen(),
      },
    ).call,
  );
}

class Routes {
  static const index = '/';
  static const settings = '/settings';
}
