import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate routerCapsule(CapsuleHandle use) {
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
