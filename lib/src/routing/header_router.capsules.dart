// ignore_for_file: avoid_print

import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate headerRouterCapsule(CapsuleHandle use) => BeamerDelegate(
      setBrowserTabTitle: false,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '*': (context, state, data) => BeamPage(
                key: ValueKey(state.uri.path),
                child: Header(
                  screenInfo: _getScreenInfo(state),
                ),
                type: BeamPageType.noTransition,
              ),
        },
      ).call,
    );

ScreenInfo _getScreenInfo(BeamState state) => ScreenInfo(
      subtitle: _getHeaderSubtitle(state.uri.path),
    );

String? _getHeaderSubtitle(String currentRoute) => switch (currentRoute) {
      Routes.index => null,
      Routes.settings => 'Settings',
      _ => throw ('Unknown route: $currentRoute'),
    };
