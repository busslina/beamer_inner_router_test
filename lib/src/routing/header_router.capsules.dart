// ignore_for_file: avoid_print

import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

BeamerDelegate headerRouterCapsule(CapsuleHandle use) => BeamerDelegate(
      setBrowserTabTitle: false,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      beamBackTransitionDelegate: const NoAnimationTransitionDelegate(),
      // locationBuilder: (info, params) {
      //   final screenInfo = _getScreenInfo(info);

      //   print(
      //     'headerRouterCapsule -- locationBuilder -- screen info: $screenInfo',
      //   );

      //   return HeaderLocation(
      //     child: Header(
      //       key: Key(info.uri.path),
      //       screenInfo: screenInfo,
      //     ),
      //   );
      // },

      locationBuilder: RoutesLocationBuilder(
        routes: {
          '*': (context, state, data) => BeamPage(
                key: ValueKey(state.uri.path),
                child: Header(
                  screenInfo: _getScreenInfo(state),
                ),
                type: BeamPageType.noTransition,
              ),
          // Routes.index: (context, state, data) => BeamPage(
          //       key: const ValueKey(Routes.index),
          //       child: Header(
          //         screenInfo: _getScreenInfo(state),
          //       ),
          //       type: BeamPageType.noTransition,
          //     ),
          // Routes.settings: (context, state, data) => BeamPage(
          //       key: const ValueKey(Routes.settings),
          //       child: Header(
          //         screenInfo: _getScreenInfo(state),
          //       ),
          //       type: BeamPageType.noTransition,
          //     ),
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

// class HeaderLocation extends BeamLocation {
//   HeaderLocation({
//     required this.child,
//   });

//   final Widget child;

//   @override
//   List<BeamPage> buildPages(
//     BuildContext context,
//     RouteInformationSerializable state,
//   ) =>
//       [
//         BeamPage(
//           key: ValueKey(state.routeInformation.uri.path),
//           child: child,
//           type: BeamPageType.noTransition,
//         ),
//       ];

//   @override
//   List<Pattern> get pathPatterns => [];
// }
