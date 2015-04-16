//
//  Resume.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resume : NSObject

@property(nonatomic, retain) NSData *profileImg;
@property(nonatomic, retain) NSString *summary;
@property(nonatomic, retain) NSString *jobTitle;
@property(nonatomic, retain) NSArray *availability;
@property(nonatomic, retain) NSString *languages;
@property(nonatomic, retain) NSString *skillsets;

@end
