//
//  UIView+blur.m
//  blurTest
//
//  Created by Muukii on 9/28/13.
//  Copyright (c) 2013 Muukii. All rights reserved.
//

#import "UIView+blur.h"
#import "UIImage+ImageEffects.h"
@implementation UIView (blur)
-(UIImage *)blurredSnapshot
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
    UIGraphicsEndImageContext();
    return blurredSnapshotImage;
}
@end
