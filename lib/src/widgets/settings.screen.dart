import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

const _title = 'Settings';

class SettingsScreen extends RearchConsumer with Screen {
  const SettingsScreen({super.key});

  // const SettingsScreen() : super(key: const Key(_title));

  @override
  Color get bgColor => Colors.red.withOpacity(0.5);

  @override
  String get title => _title;

  @override
  Widget buildBody(BuildContext context, CapsuleReader use) {
    return ElevatedButton(
      onPressed: () => context.beamBack(),
      child: const Text(' back'),
    );
  }
}
