//
//  EventPage.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/31/16.
//  Copyright © 2016 user116889. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface EventPage : UIViewController

@property(nonatomic,strong)IBOutlet UIImageView* image;
@property(nonatomic,strong)IBOutlet UILabel*  name;
@property (weak, nonatomic) IBOutlet UITextView *info;
@property(nonatomic,strong)IBOutlet UILabel* time;
@property (nonatomic,strong)NSArray* data;
@property(nonatomic,strong)IBOutlet UIButton* save;
@property (nonatomic, strong) PFObject *parseObject;
//@property(nonatomic,strong)IBOutlet
-(IBAction)saveEvent:(id)sender;
-(void)saveInPref;
-(void)readFromPref;
@end