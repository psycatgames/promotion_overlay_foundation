import 'package:promotion_overlay_platform_interface/promotion_overlay_platform_interface.dart';
import 'messages.g.dart';

/// iOS and macOS implementation of promotion_overlay.
class PromotionOverlayFoundation extends PromotionOverlayPlatform {
  final PromotionOverlayApi _api = PromotionOverlayApi();

  /// Registers this class as the default instance of
  /// [PromotionOverlayPlatform].
  static void registerWith() {
    PromotionOverlayPlatform.instance = PromotionOverlayFoundation();
  }

  @override
  Future<bool> show(String appIdentifier, String? campaignToken,
      String? providerToken, bool dismissOnBackground, int position) {
    return _api.show(appIdentifier, campaignToken, providerToken,
        dismissOnBackground, position);
  }

  @override
  Future<bool> dismiss() {
    return _api.dismiss();
  }
}
