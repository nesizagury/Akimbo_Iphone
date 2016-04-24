//
//  ViewController.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/29/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Event.h"
#import "EventPage.h"
#import "SavedEvent.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)NSArray* data;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
//@property (nonatomic,strong)IBOutlet UIBarButtonItem* savedEvent;
//@property (nonatomic,strong)IBOutlet UIBarButtonItem* realTime;
//+(void)load;
+(NSArray*)all_data_event;
-(IBAction)SavedEventPage:(id)sender;
-(IBAction)realTimePage:(id)sender;
-(IBAction)menuPage:(id)sender;


@end

