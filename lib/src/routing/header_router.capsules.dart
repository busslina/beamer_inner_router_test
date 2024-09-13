import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate headerRouterCapsule(CapsuleHandle use) => BeamerDelegate(
      setBrowserTabTitle: true,
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
      updateFromParent: true,
      updateParent: true,
    );
