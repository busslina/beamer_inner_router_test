import 'package:rearch/rearch.dart';

extension _ConvenienceExt on SideEffectRegistrar {
  SideEffectRegistrar get use => this;
}

extension SideEffectRegistrarExt on SideEffectRegistrar {
  void printConsumerLifecycle(String name) {
    final isFirstBuild = use.isFirstBuild();

    use.effect(
      () {
        print('$name -- build() -- First time: $isFirstBuild');

        return () => print('$name -- dispose()');
      },
      [],
    );
  }
}
