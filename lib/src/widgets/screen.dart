import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

mixin Screen on RearchConsumer {
  String get title;

  Color get bgColor;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    use.printConsumerLifecycle('Screen($title)');

    return SizedBox.expand(
      child: Container(
        color: bgColor,
        child: Align(
          alignment: Alignment.topLeft,
          child: buildBody(context, use),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, CapsuleReader use);
}
