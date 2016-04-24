//
//  GridViewCell.h
//  Fundigo_20_3_16_v1
//
//  Created by user116889 on 4/13/16.
//  Copyright © 2016 user116889. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AQGridView.h"
@interface GridViewCell : AQGridViewCell

@property (nonatomic, retain) UIImageView * imageView;
@property (nonatomic, retain) UILabel * ditstanceFromMe;
@property (nonatomic, retain) UILabel * captionLabel;
@end
