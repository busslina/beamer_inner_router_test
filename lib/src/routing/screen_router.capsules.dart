import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate screenRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        Routes.index: (context, state, data) => const BeamPage(
              child: IndexScreen(),
              type: BeamPageType.noTransition,
            ),
        Routes.settings: (context, state, data) => const BeamPage(
              child: SettingsScreen(),
              type: BeamPageType.noTransition,
            ),
      },
    ).call,
  );
}

class Routes {
  static const index = '/';
  static const settings = '/settings';
}
