import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController

    // 🔧 FIX: Usa correttamente il registrar e registra la view factory
    let registrar = controller.registrar(forPlugin: "SimplePlatformView")
    let factory = SimplePlatformViewFactory(messenger: controller.binaryMessenger)
    registrar.register(factory, withId: "simple-platform-view")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
