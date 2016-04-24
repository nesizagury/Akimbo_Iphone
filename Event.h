//
//  Event.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
@interface Event : PFObject<PFSubclassing>

@property(strong,nonatomic)NSString* objectId;

+ (NSString *)parseClassName;
-(void)setObjectId:(NSString *)input;
-(NSString*)getObjectId;

@end
