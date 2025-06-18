import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Ottieni il root controller Flutter
    let controller = window?.rootViewController as! FlutterViewController

    // Crea e registra la native view factory
    let factory = SimplePlatformViewFactory(messenger: controller.binaryMessenger)
    controller.registrar(forPlugin: "SimplePlatformView")?.register(factory, withId: "simple-platform-view")

    // Chiama super
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
