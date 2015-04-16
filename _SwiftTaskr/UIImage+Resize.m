//
//  UIImage+Resize.m
//  Paypal
//
//  Created by ChunQhai on 12/5/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "UIImage+Resize.h"



@implementation UIImage (Resize)

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
