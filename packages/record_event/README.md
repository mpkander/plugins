# Record events plugin

A flutter plugin to handle screen and audio capture events

## Getting Started

**Note: on iOS available only screen capture (with sound recording) event**

To check current screen capture status call method isScreenCaptureRunning() -> Bool.
The plugin will notify flutter code via "didChangeScreenRecordingStatus" callback method call.
