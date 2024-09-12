import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class SettingsScreen extends RearchConsumer with Screen {
  SettingsScreen() : super(key: GlobalKey());

  @override
  Color get bgColor => Colors.red.withOpacity(0.5);

  @override
  String get title => 'Settings';

  @override
  Widget buildBody(BuildContext context, CapsuleReader use) {
    return ElevatedButton(
      onPressed: () => context.beamBack(),
      child: const Text(' back'),
    );
  }
}
