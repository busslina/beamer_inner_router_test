import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

const _title = 'Index';

class IndexScreen extends RearchConsumer with Screen {
  const IndexScreen({super.key});

  // const IndexScreen() : super(key: const Key(_title));

  @override
  Color get bgColor => Colors.blue.withOpacity(0.5);

  @override
  String get title => _title;

  @override
  Widget buildBody(BuildContext context, CapsuleReader use) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.beamToNamed(Routes.settings),
        child: const Text('Settings'),
      ),
    );
  }
}
