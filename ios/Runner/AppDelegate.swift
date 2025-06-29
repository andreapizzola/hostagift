import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController

    let factory = SimplePlatformViewFactory(messenger: controller.binaryMessenger)
    if let registrar = controller.registrar(forPlugin: "SimplePlatformView") {
      registrar.register(factory, withId: "simple-platform-view")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
