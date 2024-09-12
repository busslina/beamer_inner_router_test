import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

late CapsuleContainer cc;

class App extends RearchConsumer {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    use.printConsumerLifecycle('App');

    use.callonce(() {
      cc = CapsuleContainerProvider.containerOf(context);
    });

    return MaterialApp.router(
      routeInformationParser: use(appRouterParserCapsule),
      routerDelegate: use(appRouterCapsule),
      debugShowCheckedModeBanner: false,
    );
  }
}
