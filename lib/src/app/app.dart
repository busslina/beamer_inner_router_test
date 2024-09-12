import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';

class App extends RearchConsumer {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    return const MaterialApp(
      home: AppScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
