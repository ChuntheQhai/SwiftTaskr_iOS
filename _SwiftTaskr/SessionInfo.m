//
//  SessionInfo.m
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import "SessionInfo.h"

@implementation SessionInfo
NSMutableArray *_jobOffers;
UserInfo *_userInfo;
Resume *_resume;

static SessionInfo *sessionInfo;

+ (SessionInfo *)getSharedInstance
{
    if( sessionInfo == nil ) {
        sessionInfo = [[SessionInfo alloc] init];
        
        _jobOffers = [[NSMutableArray alloc] init];
        
        _userInfo = [[UserInfo alloc] init];
        [_userInfo setFullname:@"Mich Xen"];
        [_userInfo setOccupation:@"Student"];
        [_userInfo setAge:21];
        
        _resume = [[Resume alloc] init];
        [_resume setSummary:@"My short summary"];
        [_resume setJobTitle:@"Freelance"];
        
        for(int i = 0; i < 20; i++) {
            JobOffer *tJobOffer = [[JobOffer alloc] init];
            
            if( i % 2 == 0 ) {
                [tJobOffer setJobImg:UIImageJPEGRepresentation([UIImage imageNamed:@"1.png"], 1)];
            } else {
                [tJobOffer setJobImg:UIImageJPEGRepresentation([UIImage imageNamed:@"7992044762_46aa5edf11_z.jpg"], 1)];
            }
            
            [tJobOffer setAddress:[NSString stringWithFormat:@"Address %zd", i]];
            [tJobOffer setTitle:[NSString stringWithFormat:@"Title %zd", i]];
            [tJobOffer setEmail:@"swiftaskr@swiftaskr.com"];
            [tJobOffer setStartDate:[NSDate new]];
            [tJobOffer setEndDate:[NSDate new]];
            [tJobOffer setStartTime:[NSDate new]];
            [tJobOffer setEndTime:[NSDate new]];
            [tJobOffer setTopCriteria:[NSString stringWithFormat:@"Top criteria %zd", i]];
            [tJobOffer setDesc:[NSString stringWithFormat:@"Description %zd", i]];
            [tJobOffer setSalary:90.0];
            
            [_jobOffers addObject:tJobOffer];
        }
    }
    
    return sessionInfo;
}

- (NSMutableArray *)getJobOffers
{
    return _jobOffers;
}

- (UserInfo *)getUserInfo
{
    return _userInfo;
}

- (Resume *)getResume
{
    return _resume;
}

- (void)addJobOffers:(JobOffer *)jobOffer
{
    [_jobOffers insertObject:jobOffer atIndex:0];
}

- (void)setResume:(Resume *)resume
{
    _resume = resume;
}

- (void)setUserInfo:(UserInfo *)userInfo
{
    _userInfo = userInfo;
}

@end
