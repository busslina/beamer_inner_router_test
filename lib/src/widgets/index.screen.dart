import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';

class IndexScreen extends RearchConsumer with Screen {
  IndexScreen() : super(key: GlobalKey());

  @override
  Color get bgColor => Colors.blue.withOpacity(0.5);

  @override
  String get title => 'Index';

  @override
  Widget buildBody() {
    return Center(
      child: ElevatedButton(onPressed: () {}, child: const Text('Settings')),
    );
  }
}
