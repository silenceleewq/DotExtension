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
 Dot's message's font.
 */
@property (nonatomic, strong) UIFont *sl_messageFont;

/**
 Dot's message
 @discussion zero indicate that just a red dot without message.
 */
@property (nonatomic, strong) NSString *sl_dotMessage;

/**
 Dot's size
 */
@property (nonatomic, assign) CGSize sl_dotSize;


/**
 Dot's Color
 */
@property (nonatomic, strong) UIColor *sl_dotColor;


/**
 defualt is (0, 0)
 positive x value is go right nagetive is go left
 positive y value is go down negative is go up.
 */
@property (nonatomic, assign) CGPoint sl_dotEdgeInset;

/*
    whether use autoLayout.
 */
@property (nonatomic, assign, getter=isUseAutoLayout) BOOL useAutoLayout;

@end
