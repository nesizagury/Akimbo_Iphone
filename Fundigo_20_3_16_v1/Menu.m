//
//  Menu.m
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/18/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "Menu.h"

@implementation Menu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)SendSms:(id)sender
{
    
    NSString* userPhoneNumber=self.smsFieldNumbre.text;
    //NSString* defaultRegion = [SINDeviceRegion currentCountryCode];
   // NSError *parseError = nil;
   // id<SINPhoneNumber> phoneNumber = [SINPhoneNumberUtil() parse:userPhoneNumber
                                               //    defaultRegion:defaultRegion
                                                    //       error:&parseError];
    if (userPhoneNumber==nil || userPhoneNumber.length!=10){
        // Handle invalid user input
        NSLog(@"NOT INVIELD NUMBER");
    }
    else
    {
        // NSString *phoneNumberInE164 = [SINPhoneNumberUtil() formatNumber:phoneNumber
        //                                                       format:SINPhoneNumberFormatE164];
        // NSLog(@"NUmberPhoe = %@",phoneNumberInE164);
        userPhoneNumber=[userPhoneNumber substringFromIndex:1];
        NSString *combined = [NSString stringWithFormat:@"%@%@", @"972", userPhoneNumber];
        NSLog(@"%@",combined);
        id<SINVerification> verification = [SINVerification SMSVerificationWithApplicationKey:@"b9ee3da5-0dc9-40aa-90aa-3d30320746f3"
                                                                              phoneNumber:combined];
        self.verification = verification; // retain the verification instance
        
        [verification initiateWithCompletionHandler:^(BOOL success, NSError *error) {
            if (success) {
            // Show UI for entering the code which will be received via SMS
                NSLog(@"I am in sent sms");
                
            }
        }];
    }
    NSLog(@"I success yohooooooo");
    
}

- (IBAction)done:(id)sender {
    // User pressed a "Done" button after entering the code from the SMS.
    NSString* code = self.CodeSms.text;
    [self.verification verifyCode:code completionHandler:^(BOOL success, NSError* error) {
        if (success) {
            // Phone number was successfully verified
            NSLog(@"I success yohooooooo");
        } else {
            // Ask user to re-attempt verification
            NSLog(@"I am not success");
        }
    }];
}

@end
