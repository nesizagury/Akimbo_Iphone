//
//  SavedEvent.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/11/16.
//  Copyright © 2016 user116889. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RealTime.h"
#import "ViewController.h"
@interface SavedEvent : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)NSArray* data;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
-(IBAction)RealTimePage:(id)sender;
-(IBAction)EventPage:(id)sender;

@end
