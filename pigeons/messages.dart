import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  swiftOut: 'darwin/Classes/messages.g.swift',
  copyrightHeader: 'pigeons/copyright_header.txt',
))
@HostApi(dartHostTestHandler: 'TestPromotionOverlayApi')
abstract class PromotionOverlayApi {
  bool show(
    String appIdentifier,
    String? campaignToken,
    String? providerToken,
    bool dismissOnBackground,
    int position,
  );
  bool dismiss();
}

// flutter pub run pigeon --input pigeons/messages.dart


