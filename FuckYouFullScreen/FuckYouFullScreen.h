//
//  FuckYouFullScreen.h
//  FuckYouFullScreen
//
//  Created by Evan Lucas on 7/22/15
//  Copyright (c) 2015 Evan Lucas. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JRSwizzle.h"
@interface FuckYouFullScreen : NSObject
+ (FuckYouFullScreen *)sharedInstance;
- (void)swizzle;
@end
