import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate appRouterCapsule(CapsuleHandle use) {
  final appScaffoldKey = GlobalKey();

  print('appScaffoldKey: $appScaffoldKey');

  final appScaffold = use.lazyValue(
    () => AppScaffold(
      key: appScaffoldKey,
    ),
  );

  return use.memo(
    () => BeamerDelegate(
      // locationBuilder: RoutesLocationBuilder(
      //   routes: {
      //     // '*': (_, __, ___) => appScaffold,
      //     '/*': (_, __, ___) => appScaffold,
      //   },
      // ).call,
      locationBuilder: (info, params) => RootLocation(child: appScaffold),
    ),
  );

  // return BeamerDelegate(
  //   locationBuilder: RoutesLocationBuilder(
  //     routes: {
  //       // '*': (_, __, ___) => AppScaffold(
  //       //     // key: appScaffoldKey,
  //       //     ),
  //       '*': (_, __, ___) => appScaffold,
  //     },
  //   ).call,
  // );
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
