import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate appRouterCapsule(CapsuleHandle use) => BeamerDelegate(
      setBrowserTabTitle: false,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      stackBuilder: (info, params) => RootStack(),
    );

BeamerParser appRouterParserCapsule(CapsuleHandle use) => BeamerParser();

class RootStack extends BeamStack {
  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) =>
      [
        const BeamPage(
          key: ValueKey('RootLocation'),
          child: AppScaffold(),
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [];
}
