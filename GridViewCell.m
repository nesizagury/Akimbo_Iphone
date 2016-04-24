//
//  GridViewCell.m
//  Fundigo_20_3_16_v1
///Users/user116889/Desktop/Fundigo_20_3_16_v1
//  Created by user116889 on 4/13/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import "GridViewCell.h"

@implementation GridViewCell

-(id) initWithFrame: (CGRect) frame reuseIdentifier: (NSString *) aReuseIdentifier
{
    self = [super initWithFrame: frame reuseIdentifier: aReuseIdentifier];
    if ( self)
    {
        
        UIView* mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 123)];
        [mainView setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *frameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(9, 4, 142, 117)];
        
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(13, 8, 135, 84)];
        
        self.captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 92, 127, 21)];
        [self.captionLabel setFont:[UIFont systemFontOfSize:14]];
        
        self.ditstanceFromMe=[[UILabel alloc] initWithFrame:CGRectMake(13, 110, 100, 20)];
        [self.ditstanceFromMe setFont:[UIFont systemFontOfSize:14]];
        
        [mainView addSubview:self.imageView];
        [mainView addSubview:frameImageView];
        [mainView addSubview:self.captionLabel];
        [mainView addSubview:self.ditstanceFromMe];
        
        [self.contentView addSubview:mainView];
        
    }
    
    return self;
}

@end
