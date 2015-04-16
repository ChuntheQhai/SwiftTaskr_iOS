//
//  JobOffer.h
//  _SwiftTaskr
//
//  Created by Cheah Bee Kim on 12/7/14.
//  Copyright (c) 2014 ChunQhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JobOffer : NSObject

@property(nonatomic, retain) NSString *address;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *email;
@property(nonatomic, retain) NSDate *startTime;
@property(nonatomic, retain) NSDate *endTime;
@property(nonatomic, retain) NSDate *startDate;
@property(nonatomic, retain) NSDate *endDate;
@property(nonatomic, retain) NSString *topCriteria;
@property(nonatomic, retain) NSString *desc;
@property(nonatomic, retain) NSData *jobImg;
@property(nonatomic, retain) NSString *testImg;

@property(nonatomic) CGFloat salary;

@end
