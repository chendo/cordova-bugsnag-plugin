#import "BugsnagBridge.h"


@implementation BugsnagBridge

- (void)pluginInitialize {
    [super pluginInitialize];

    NSString* apiKey = self.commandDelegate.settings[@"bugsnag-ios-api-key"] ?: [[NSBundle mainBundle] objectForInfoDictionaryKey:@"BugsnagApiKey"];

    if (apiKey) {
        [Bugsnag startBugsnagWithApiKey: apiKey];
    }
}

- (void)handleCommand:(CDVInvokedUrlCommand *)command block:(NSString * (^)(NSArray *args))block {
    CDVPluginResult *result = nil;
    NSArray *args = command.arguments;

    NSString *err = block(args);
    if (!err) {
        result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK];
    } else {
        result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString: err];
    }

    [self.commandDelegate sendPluginResult: result callbackId: command.callbackId];
}


- (void)setUser:(CDVInvokedUrlCommand*)command {
    [self handleCommand:command block:^NSString *(NSArray *args) {
        if (args.count < 3) {
            return @"You must supply 3 arguments: userId, name, email";
        }

        NSString *userId = args[0];
        NSString *name   = args[1];
        NSString *email  = args[2];

        [[Bugsnag configuration] setUser: userId withName: name andEmail: email];
        return nil;
    }];
}

- (void)addAttribute:(CDVInvokedUrlCommand*)command {
    [self handleCommand:command block:^NSString *(NSArray *args) {
        if (args.count < 3) {
            return @"You must supply 3 arguments: userId, name, email";
        }

        NSString *attrName  = args[0];
        NSString *attrValue = args[1];
        NSString *tabName   = args[2];

        [Bugsnag addAttribute: attrName withValue: attrValue toTabWithName: tabName];
        return nil;
    }];
}

- (void)testReporting:(CDVInvokedUrlCommand*)command {
    [self handleCommand:command block:^NSString *(NSArray *args) {
        [Bugsnag notifyError:[NSError errorWithDomain:@"au.com.drme.test" code:408 userInfo:nil]];
        return nil;
    }];
}

@end
