//
//  Event.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "Event.h"


@implementation Event
@dynamic objectId;

-(void)setObjectId:(NSString *)input{
self.objectId=input;
}

-(NSString*)getObjectId{
    return self.objectId;
}

+ (NSString *)parseClassName {
    return @"Event";
}
@end
