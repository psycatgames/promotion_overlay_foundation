import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/messages.g.dart',
  dartTestOut: 'test/test_api.g.dart',
  swiftOut: 'darwin/Classes/messages.g.swift',
  copyrightHeader: 'pigeons/copyright_header.txt',
))
@HostApi(dartHostTestHandler: 'TestPromotionOverlayApi')

/// The host-side implementation of the PromotionOverlayApi.
abstract class PromotionOverlayApi {
  /// Shows the promotion overlay with [appIdentifier] using SKOverlay
  /// Returns true if the overlay was shown, false otherwise
  bool show(
    String appIdentifier,
    String? campaignToken,
    String? providerToken,
    bool dismissOnBackground,
    int position,
  );

  /// Dismisses the promotion overlay
  bool dismiss();
}

// flutter pub run pigeon --input pigeons/messages.dart


