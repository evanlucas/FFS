//
//  FFS.m
//  FFS
//
//  Created by Evan Lucas on 7/22/15
//  Copyright (c) 2015 Evan Lucas. All rights reserved.
//

#import "FFS.h"

@implementation NSWindow (FFS)
- (BOOL)FFS_showsFullScreenButton {
  return NO;
}
@end

@implementation FFS
+ (void)load {
  FFS *controller = [FFS sharedInstance];
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
  [NSWindow jr_swizzleMethod:@selector(showsFullScreenButton) withMethod:@selector(FFS_showsFullScreenButton) error:&error];
  
  if (error) {
    NSLog(@"Unable to swizzle showsFullScreenButton: %@", error);
  }
}
@end
