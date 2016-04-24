//
//  EventInfo.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface EventInfo : NSObject
@property (nonatomic, strong)NSString* dateAsString;
@property (nonatomic, strong)NSString* name;
@property (nonatomic, strong)NSString* tags;
@property (nonatomic, strong)NSString* price;
@property (nonatomic, strong)NSString* info;
@property (nonatomic, strong)NSString* place;
@property (nonatomic, strong)NSString* address;
@property (nonatomic, strong)NSString* city;
@property (nonatomic, strong)NSString* toilet;
@property (nonatomic, strong)NSString* parking;
@property (nonatomic, strong)NSString* capacity;
@property (nonatomic, strong)NSString* atm;
@property (nonatomic, strong)NSString* filterName;
@property (nonatomic, strong)NSString* producerId;
@property (nonatomic, strong)NSString* picUrl;
@property (nonatomic, strong)NSString* fbUrl;
@property (nonatomic, strong)NSString* parseObjectId;
@property (nonatomic, strong)NSString* artist;
@property (nonatomic, assign)BOOL* isSaved;
@property (nonatomic, assign)BOOL*isFutureEvent;
@property (nonatomic, assign)BOOL*isStadium;
@property (nonatomic, assign)NSInteger* NumOfTickets;
@property (nonatomic, strong)UIImage* ImageID;
@property (nonatomic, strong)NSDate* date;
@property (nonatomic, assign)double* dist;
@property (nonatomic, assign)double* x;
@property (nonatomic, assign)double* y;
    


-(void)setDataAsString:(NSString *)input;
-(void)setName:(NSString *)input;
-(void)setTags:(NSString *)input;
-(void)setPrice:(NSString *)input;
-(void)setInfo:(NSString *)input;
-(void)setPlace:(NSString *)input;
-(void)setAddress:(NSString *)input;
-(void)setCity:(NSString *)input;
-(void)setToilet:(NSString *)input;
-(void)setParking:(NSString *)input;
-(void)setCapacity:(NSString *)input;
-(void)setAtm:(NSString *)input;
-(void)setFiltreName:(NSString *)input;
-(void)setProducerId:(NSString *)input;
-(void)setPicUrl:(NSString *)input;
-(void)setFbUrl:(NSString *)input;
-(void)setParsObjectId:(NSString *)input;
-(void)setArtist:(NSString *)input;
-(void)setIsSaved:(BOOL *)input;
-(void)setIsFutureEvent:(BOOL *)input;
-(void)setIsStadium:(BOOL *)input;
-(void)setNumOfTickets:(NSInteger *)input;
-(void)setImageId:(UIImage *)input;
-(void)setDate:(NSDate *)input;
-(void)setDist:(double *)input;
-(void)setX:(double *)input;
-(void)setY:(double *)input;

-(NSString*)getDataAsString;
-(NSString*)getName;
-(NSString*)getTags;
-(NSString*)getPrice;
-(NSString*)getInfo;
-(NSString*)getPlace;
-(NSString*)getAddress;
-(NSString*)getCity;
-(NSString*)getToilet;
-(NSString*)getParking;
-(NSString*)getCapacity;
-(NSString*)getAtm;
-(NSString*)getFiltreName;
-(NSString*)getProducerId;
-(NSString*)getPicUrl;
-(NSString*)getFbUrl;
-(NSString*)getParsObjectId;
-(NSString*)getArtist;
-(Boolean*)getIsSaved;
-(Boolean*)getIsFutureEvent;
-(Boolean*)getIsStadium;
-(int*)getNumOfTickets;
-(UIImage*)getImageId;
-(NSDate*)getDate;
-(double*)getDist;
-(double*)getX;
-(double*)getY;


@end
