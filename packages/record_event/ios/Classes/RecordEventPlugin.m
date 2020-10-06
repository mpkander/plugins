#import "RecordEventPlugin.h"
#if __has_include(<record_event/record_event-Swift.h>)
#import <record_event/record_event-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "record_event-Swift.h"
#endif

@implementation RecordEventPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRecordEventPlugin registerWithRegistrar:registrar];
}
@end
