//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<background_fetch/BackgroundFetchPlugin.h>)
#import <background_fetch/BackgroundFetchPlugin.h>
#else
@import background_fetch;
#endif

#if __has_include(<hardware_buttons/HardwareButtonsPlugin.h>)
#import <hardware_buttons/HardwareButtonsPlugin.h>
#else
@import hardware_buttons;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [BackgroundFetchPlugin registerWithRegistrar:[registry registrarForPlugin:@"BackgroundFetchPlugin"]];
  [HardwareButtonsPlugin registerWithRegistrar:[registry registrarForPlugin:@"HardwareButtonsPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
