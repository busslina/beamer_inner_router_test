import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate appRouterCapsule(CapsuleHandle use) {
  return BeamerDelegate(
    locationBuilder: (info, params) => RootLocation(
      child: const AppScaffold(),
    ),
  );
}

BeamerParser appRouterParserCapsule(CapsuleHandle use) => BeamerParser();

class RootLocation extends BeamLocation {
  RootLocation({
    required this.child,
  });

  final Widget child;

  @override
  List<BeamPage> buildPages(
    BuildContext context,
    RouteInformationSerializable state,
  ) =>
      [BeamPage(child: child)];

  @override
  List<Pattern> get pathPatterns => [];
}
