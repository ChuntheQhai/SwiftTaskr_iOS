//
//  UIImage+Resize.h
//  Paypal
//
//  Created by ChunQhai on 12/5/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end
