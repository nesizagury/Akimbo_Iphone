//
//  Menu.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/18/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SinchVerification/SinchVerification.h>

@interface Menu : UIViewController


@property(nonatomic,retain) id<SINVerification> verification;
@property (strong, nonatomic) IBOutlet UITextField *smsFieldNumbre;
@property (strong, nonatomic) IBOutlet UITextField *CodeSms;

-(IBAction)SendSms:(id)sender;
- (IBAction)done:(id)sender;
@end
