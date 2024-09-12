import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class App extends RearchConsumer {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // ignore: avoid_print
    void debug(String msg) => print('App -- $msg');

    use.printConsumerLifecycle('App');

    final router = use(appRouterCapsule);

    use.effect(
      () {
        debug('Setting up router listener');

        void listener() {
          debug(
            'Router listener -- ${router.currentBeamLocation.state.routeInformation.uri.path}',
          );
        }

        router.addListener(listener);

        return () => router.removeListener(listener);
      },
      [],
    );

    return MaterialApp.router(
      routeInformationParser: use(appRouterParserCapsule),
      routerDelegate: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
