import 'package:beamer_inner_router_test/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';

class Header extends RearchConsumer {
  const Header({
    super.key,
    required this.screenInfo,
  });

  final ScreenInfo screenInfo;

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final isFirstBuild = use.isFirstBuild();

    final subtitle = screenInfo.subtitle;

    print('header build -- First time: $isFirstBuild -- subtitle: $subtitle');

    return Container(
      color: Colors.grey,
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          const Text(
            appTitle,
            style: TextStyle(fontSize: 28),
          ),

          // Subtitle
          if (subtitle != null)
            Text(
              subtitle,
              style: const TextStyle(fontSize: 18),
            ),
        ],
      ),
    );
  }
}
