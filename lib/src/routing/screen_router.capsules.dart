import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate screenRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        Routes.index: (context, state, data) {
          print('screenRouterCapsule -- index builder');
          return const IndexScreen();
        },
        Routes.settings: (context, state, data) {
          print('screenRouterCapsule -- settings builder');
          return const SettingsScreen();
        },
      },
    ).call,
  );
}

class Routes {
  static const index = '/';
  static const settings = '/settings';
}
