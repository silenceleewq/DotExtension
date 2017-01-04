//
//  UIView+SLDot.h
//  RedDotTest
//
//  Created by lirenqiang on 2017/1/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SLDot)
/**
 Dot's number
 */
@property (nonatomic, assign) NSInteger messageCount;


/**
 Dot's size
 */
@property (nonatomic, assign) CGSize dotSize;


/**
 Dot's Color
 */
@property (nonatomic, strong) UIColor *dotColor;


/**
 defualt is (0, 0)
 positive x value is go right nagetive is go left
 positive y value is go down negative is go up.
 */
@property (nonatomic, assign) CGSize edgeInset;

@end
