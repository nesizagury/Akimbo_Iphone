//
//  EventInfo.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "EventInfo.h"

@implementation EventInfo
@synthesize dateAsString;
@synthesize name;
@synthesize tags;
@synthesize price;
@synthesize info;
@synthesize place;
@synthesize address;
@synthesize city;
@synthesize toilet;
@synthesize parking;
@synthesize capacity;
@synthesize atm;
@synthesize filterName;
@synthesize producerId;
@synthesize picUrl;
@synthesize fbUrl;
@synthesize parseObjectId;
@synthesize artist;
@synthesize isSaved;
@synthesize isFutureEvent;
@synthesize isStadium;
@synthesize NumOfTickets;
@synthesize ImageID;
@synthesize date;
@synthesize dist;
@synthesize x;
@synthesize y;
-(void)setDataAsString:(NSString *)input{
    dateAsString = input;
}
-(void)setName:(NSString *)input{
    name = input;
}
-(void)setTags:(NSString *)input{
    tags = input;
}
-(void)setPrice:(NSString *)input{
    price = input;
}
-(void)setInfo:(NSString *)input{
    info = input;
}
-(void)setPlace:(NSString *)input{
    place = input;
}
-(void)setAddress:(NSString *)input{
    address = input;
}
-(void)setCity:(NSString *)input{
    city = input;
}
-(void)setToilet:(NSString *)input{
    toilet = input;
}
-(void)setParking:(NSString *)input{
    parking = input;
}
-(void)setCapacity:(NSString *)input{
    capacity = input;
}
-(void)setAtm:(NSString *)input{
    atm = input;
}
-(void)setFiltreName:(NSString *)input{
    filterName = input;
}
-(void)setProducerId:(NSString *)input{
    producerId = input;
}
-(void)setPicUrl:(NSString *)input{
    picUrl = input;
}
-(void)setFbUrl:(NSString *)input{
    fbUrl = input;
}
-(void)setParsObjectId:(NSString *)input{
    parseObjectId = input;
}
-(void)setArtist:(NSString *)input{
    artist = input;
}
-(void)setIsSaved:(BOOL *)input{
    isSaved = input;
}
-(void)setIsFutureEvent:(BOOL *)input{
    isFutureEvent = input;
}
-(void)setIsStadium:(BOOL *)input{
    isStadium = input;
}
-(void)setNumOfTickets:(NSInteger *)input{
    NumOfTickets =input;
}
-(void)setImageId:(UIImage *)input{
    ImageID = input;
}
-(void)setDate:(NSDate *)input{
    date = input;
}
-(void)setDist:(double *)input{
    dist = input;
}
-(void)setX:(double *)input{
    x = input;
}
-(void)setY:(double *)input{
    y = input;
}

-(NSString*)getDataAsString{
    return dateAsString;
}
-(NSString*)getName{
    return name;
}
-(NSString*)getTags{
    return tags;
}
-(NSString*)getPrice{
    return price;
}
-(NSString*)getInfo{
    return info;
}
-(NSString*)getPlace{
    return place;
}
-(NSString*)getAddress{
    return address;
}
-(NSString*)getCity{
    return city;
}
-(NSString*)getToilet{
    return  toilet;
}
-(NSString*)getParking{
    return parking;
}
-(NSString*)getCapacity{
    return capacity;
}
-(NSString*)getAtm{
    return atm;
}
-(NSString*)getFiltreName;{
    return filterName;
}
-(NSString*)getProducerId{
    return producerId;
}
-(NSString*)getPicUrl{
    return picUrl;
}
-(NSString*)getFbUrl{
    return fbUrl;
}
-(NSString*)getParsObjectId{
    return parseObjectId;
}
-(NSString*)getArtist{
    return artist;
}
-(Boolean*)getIsSaved{
    return isSaved;
}
-(Boolean*)getIsFutureEvent{
    return isFutureEvent;
}
-(Boolean*)getIsStadium{
    return isStadium;
}
-(int*)getNumOfTickets{
    return NumOfTickets;
}
-(UIImage*)getImageId{
    return ImageID;
}
-(NSDate*)getDate{
    return date;
}
-(double*)getDist{
    return dist;
}
-(double*)getX{
    return  x;
}
-(double*)getY{
    return y;
}@end
