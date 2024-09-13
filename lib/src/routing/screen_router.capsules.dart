import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate screenRouterCapsule(CapsuleHandle use) => BeamerDelegate(
      setBrowserTabTitle: true,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder: RoutesLocationBuilder(
        routes: {
          Routes.index: (context, state, data) => BeamPage(
                key: const ValueKey(Routes.index),
                child: const IndexScreen(),
                title: _getScreenTitle(state),
              ),
          Routes.settings: (context, state, data) => BeamPage(
                key: const ValueKey(Routes.settings),
                child: const SettingsScreen(),
                title: _getScreenTitle(state),
              ),
        },
      ).call,
    );

class Routes {
  static const index = '/';
  static const settings = '/settings';
}

String? _getScreenTitle(BeamState state) {
  final path = state.uri.path;
  final screenTitle = switch (path) {
    Routes.index => null,
    Routes.settings => 'Settings',
    _ => throw ('Unknown route: $path'),
  };

  return screenTitle == null ? appTitle : '$screenTitle - $appTitle';
}
