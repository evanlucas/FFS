//
//  FuckYouFullScreen.m
//  FuckYouFullScreen
//
//  Created by Evan Lucas on 7/22/15
//  Copyright (c) 2015 Evan Lucas. All rights reserved.
//

#import "FuckYouFullScreen.h"

@implementation NSWindow (FuckYouFullScreen)
- (BOOL)FuckYouFullScreen_showsFullScreenButton {
  return NO;
}
@end

@implementation FuckYouFullScreen
+ (void)load {
  FuckYouFullScreen *controller = [FuckYouFullScreen sharedInstance];
  [controller swizzle];
}

+ (instancetype)sharedInstance {
  static id plugin = nil;
  if (plugin == nil) {
    plugin = [[self alloc] init];
  }
  
  return plugin;
}

- (void)swizzle {
  NSError *error = nil;
  [NSWindow jr_swizzleMethod:@selector(showsFullScreenButton) withMethod:@selector(FuckYouFullScreen_showsFullScreenButton) error:&error];
  
  if (error) {
    NSLog(@"Unable to swizzle showsFullScreenButton: %@", error);
  }
}
@end
