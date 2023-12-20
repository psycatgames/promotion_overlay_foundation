import Foundation
import StoreKit
import Flutter
import UIKit

#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#endif

public class PromotionOverlayPlugin: NSObject, SKOverlayDelegate, FlutterPlugin, PromotionOverlayApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = PromotionOverlayPlugin()
    // Workaround for https://github.com/flutter/flutter/issues/118103.
    #if os(iOS)
        let messenger = registrar.messenger()
    #else
        let messenger = registrar.messenger
    #endif
        PromotionOverlayApiSetup.setUp(binaryMessenger: messenger, api: instance)
  }

  private var scene: UIWindowScene?

  func show(appIdentifier: String, campaignToken: String?, providerToken: String?, dismissOnBackground: Bool, position: Int64) throws -> Bool {
      guard let viewController = UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController else {
      NSLog("[PromotionOverlayPlugin] Error: Unable to get root view controller.")
      return false
    }

    let overlayPosition = SKOverlay.Position(rawValue: Int(position))!

    self.scene = viewController.view.window?.windowScene
    let config = SKOverlay.AppConfiguration(appIdentifier: appIdentifier, position: overlayPosition)
    config.campaignToken = campaignToken
    config.providerToken = providerToken
      
    let overlay = SKOverlay(configuration: config)
    overlay.delegate = self
    overlay.present(in: scene!)

    if (dismissOnBackground) {
      NSLog("[PromotionOverlayPlugin] Dismiss on background enabled.")
      let notificationCenter = NotificationCenter.default
      notificationCenter.addObserver(self, selector: #selector(self.appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }

    return true
  }

  func dismiss() -> Bool {
      return self.dismissOverlay()
  }

  private func dismissOverlay() -> Bool {
    if let s = scene {
        NSLog("[PromotionOverlayPlugin] Promotion overlay dismissed]")
        SKOverlay.dismiss(in: s)
        return true
    }
      
    NSLog("[PromotionOverlayPlugin] Error: Unable to dismiss promotion overlay.")
    return false
  }

  @objc public func appMovedToBackground() {
    _ = self.dismissOverlay()
  }

  public func storeOverlayWillStartPresentation(_ overlay: SKOverlay, transitionContext: SKOverlay.TransitionContext) {
    NSLog("Indicates that the platform presents an overlay.")
  }

  public func storeOverlayWillStartDismissal(_ overlay: SKOverlay, transitionContext: SKOverlay.TransitionContext) {
    NSLog("Indicates that the platform dismisses an overlay.")
  }

  public func storeOverlayDidFinishDismissal(_ overlay: SKOverlay, transitionContext: SKOverlay.TransitionContext) {
    NSLog("Indicates that platform finished dismissing an overlay.")
  }
}
