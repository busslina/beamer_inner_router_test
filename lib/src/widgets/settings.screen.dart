import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class SettingsScreen extends RearchConsumer with Screen {
  const SettingsScreen({super.key});

  @override
  // Color get bgColor => Colors.red.withOpacity(0.5);
  Color get bgColor => Colors.red;

  @override
  String get title => 'Settings';

  @override
  Widget buildBody(BuildContext context, CapsuleReader use) {
    return ElevatedButton(
      onPressed: () {
        print('Settings -- back');
        // context.beamBack();
        // context.popToNamed(Routes.index);
        context.beamToNamed(Routes.index);
      },
      child: const Text(' back'),
    );
  }
}
