//
//  EventPage.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 3/31/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "EventPage.h"
@interface EventPage()

@end
@implementation EventPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PFFile* imageFile=self.parseObject[@"ImageFile"];
    NSData* imageData =[imageFile getData];
    self.image.image=[UIImage imageWithData:imageData];
    self.name.text=self.parseObject[@"Name"];
    self.info.text=self.parseObject[@"description"];
    self.info.editable =false;
    NSDate* date = self.parseObject[@"realDate"];
   // NSString* myNewString = [NSString stringWithFormat:@"%f", date.timeIntervalSince1970];
    NSDateFormatter* dateFormat=[[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    self.time.text =[NSString stringWithFormat:@"%@",[dateFormat stringFromDate:date]];
    [self readFromPref];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveInPref
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *currentLevelKey = self.parseObject.objectId;
    
    //const Boolean currentLevel = true;
    [preferences setValue:currentLevelKey forKey:currentLevelKey];
    
    //  Save to disk
    const BOOL didSave = [preferences synchronize];
    if (!didSave)
    {
        //  Couldn't save (I've never seen this happen in real world testing)
    }
    else
    {
      [self.save setTitle:@"unSave" forState:UIControlStateNormal];
    }
 
}

-(void)readFromPref
{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *currentLevelKey = self.parseObject.objectId;
    
    if ([preferences objectForKey:currentLevelKey] == nil)
    {
        //  Doesn't exist.
    }
    else
    {
        //  Get current level
        const BOOL currentLevel = [preferences boolForKey:currentLevelKey];
        [self.save setTitle:@"unSave" forState:UIControlStateNormal];
    }
}
-(IBAction)saveEvent:(id)sender
{
    UIButton* butoon=(UIButton*)sender;
    if([butoon.titleLabel.text isEqual:@"save"])
    {
        [self saveInPref];
    }
    else
    {
        [self.save setTitle:@"save" forState:UIControlStateNormal];
        NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
        
        NSString *event = self.parseObject.objectId;
        [preferences removeObjectForKey:event];
        const BOOL didSave = [preferences synchronize];
        
        if (!didSave)
        {
            //  Couldn't save (I've never seen this happen in real world testing)
        }
    }
}

@end
