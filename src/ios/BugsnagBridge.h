#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Bugsnag/Bugsnag.h>

@interface BugsnagBridge : CDVPlugin
{
// empty
}


// BUGSNAG API

// - (void)setApiKey:(CDVInvokedUrlCommand*)command;
// - (void)setAppVersion:(CDVInvokedUrlCommand*)command;
// - (void)setAutomaticallyCollectBreadcrumbs:(CDVInvokedUrlCommand*)command;
// - (void)setAutoNotify:(CDVInvokedUrlCommand*)command;
// - (void)setContext:(CDVInvokedUrlCommand*)command;
// - (void)setNotifyReleaseStages:(CDVInvokedUrlCommand*)command;
// - (void)setNotifyURL:(CDVInvokedUrlCommand*)command;
// - (void)setReleaseStage:(CDVInvokedUrlCommand*)command;
- (void)setUser:(CDVInvokedUrlCommand*)command;

// - (void)leaveBreadcrumbWithMessage:(CDVInvokedUrlCommand*)command;

// addAttribute:withValue:toTabWithName
- (void)addAttribute:(CDVInvokedUrlCommand*)command;

// - (void)clearTabWithName:(CDVInvokedUrlCommand*)command;

- (void)testReporting:(CDVInvokedUrlCommand*)command;
- (void)forceCrash:(CDVInvokedUrlCommand*)command;

@end
