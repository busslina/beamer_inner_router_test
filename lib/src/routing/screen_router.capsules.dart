import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate screenRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    setBrowserTabTitle: true,
    // beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: RoutesLocationBuilder(
      routes: {
        Routes.index: (context, state, data) => const BeamPage(
              key: ValueKey(Routes.index),
              child: IndexScreen(),
              type: BeamPageType.noTransition,
              opaque: false,
            ),
        Routes.settings: (context, state, data) => const BeamPage(
              key: ValueKey(Routes.settings),
              child: SettingsScreen(),
              type: BeamPageType.noTransition,
              opaque: false,
            ),
      },
    ).call,
  );
}

class Routes {
  static const index = '/';
  static const settings = '/settings';
}

String? getScreenHeaderSubtitle(String currentRoute) => switch (currentRoute) {
      Routes.index => null,
      Routes.settings => 'Settings',
      _ => throw ('Unknown route: $currentRoute'),
    };
