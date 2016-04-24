//
//  RealTime.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/11/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SavedEvent.h"
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <Parse/Parse.h>
#import "AQGridView.h"
#import "GridViewCell.h"
@interface RealTime : UIViewController<AQGridViewDelegate, AQGridViewDataSource,CLLocationManagerDelegate>


@property (nonatomic,retain) CLLocationManager *locationManager;
@property (nonatomic,strong)CLLocation* demoLocation;
@property (nonatomic,strong)NSArray* data;
@property (nonatomic, retain) IBOutlet AQGridView * gridView;

-(void)findGPS;
-(IBAction)SavedEventPage:(id)sender;
-(IBAction)EventPage:(id)sender;
@end
