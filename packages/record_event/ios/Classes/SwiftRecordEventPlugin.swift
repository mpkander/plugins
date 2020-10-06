import Flutter
import UIKit


public class SwiftRecordEventPlugin: NSObject, FlutterPlugin {
  private static var handler: ScreenRecordingEventHandler?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "record_event", binaryMessenger: registrar.messenger())
    let instance = SwiftRecordEventPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)

    handler = ScreenRecordingEventHandler(channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isScreenCaptureRunning":
        result(SwiftRecordEventPlugin.handler?.isScreenRecording() ?? false)
    default:
        print("*** [\(SwiftRecordEventPlugin.self)] Unknown method name '\(call.method)' ***")
    }
  }
}


fileprivate class ScreenRecordingEventHandler {
  private let channel: FlutterMethodChannel

  init(channel: FlutterMethodChannel) {
    self.channel = channel

    if #available(iOS 11.0, *) {
      NotificationCenter.default.addObserver(self, selector: #selector(didChangeScreenRecordingStatus), name: UIScreen.capturedDidChangeNotification, object: nil)
    }
  }

  func isScreenRecording() -> Bool {
    if #available(iOS 11.0, *) {
      return UIScreen.main.isCaptured
    } else {
      return false
    }
  }

  @objc
  private func didChangeScreenRecordingStatus() {
    if #available(iOS 11.0, *) {
      channel.invokeMethod("didChangeScreenRecordingStatus", arguments: UIScreen.main.isCaptured)
    }
  }
}
