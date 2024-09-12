import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

mixin Screen on RearchConsumer {
  String get title;

  Color get bgColor;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
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
