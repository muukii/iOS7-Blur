//
//  UIView+blur.m
//  blurTest
//
//  Created by Muukii on 9/28/13.
//  Copyright (c) 2013 Muukii. All rights reserved.
//
#import "UIView+blur.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"

@implementation UIView (blur)
-(UIImage *)blurredSnapshot
{
    UIImage *blurredSnapshotImage;
    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        blurredSnapshotImage = [snapshotImage applyLightEffect];
        UIGraphicsEndImageContext();
    } else {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        blurredSnapshotImage = [snapshotImage applyLightEffect];
        UIGraphicsEndImageContext();
    }
    return blurredSnapshotImage;
}
@end
