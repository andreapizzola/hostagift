import Flutter
import UIKit

class SimplePlatformView: NSObject, FlutterPlatformView {
  private let _view: UIView

  init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?) {
    self._view = UIView(frame: frame)
    super.init()
    self._view.backgroundColor = UIColor.blue
  }

  func view() -> UIView {
    return _view
  }
}

class SimplePlatformViewFactory: NSObject, FlutterPlatformViewFactory {
  private var messenger: FlutterBinaryMessenger

  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger
    super.init()
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    return SimplePlatformView(
      frame: frame,
      viewIdentifier: viewId,
      arguments: args,
      binaryMessenger: messenger
    )
  }
}
