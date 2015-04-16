//
//  SessionInfo.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobOffer.h"
#import "UserInfo.h"
#import "Resume.h"

@interface SessionInfo : NSObject

+ (SessionInfo *)getSharedInstance;
- (NSMutableArray *)getJobOffers;
- (UserInfo *)getUserInfo;
- (Resume *)getResume;

- (void)addJobOffers:(JobOffer *)jobOffer;
- (void)setResume:(Resume *)resume;
- (void)setUserInfo:(UserInfo *)userInfo;

@end
