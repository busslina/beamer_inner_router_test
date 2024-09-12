import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

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
