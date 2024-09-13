import 'package:beamer/beamer.dart';
import 'package:beamer_inner_router_test/lib.dart';
import 'package:rearch/rearch.dart';

extension CapsuleReaderExt on CapsuleReader {
  BeamerDelegate get appRouter => call(appRouterCapsule);
}
