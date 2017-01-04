//
//  UIView+SLDot.m
//  RedDotTest
//
//  Created by lirenqiang on 2017/1/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "UIView+SLDot.h"
#import <objc/runtime.h>

#define defualtDotSize 20


static char *dotMessageKey = "dotMessageKey";
static char *DotKey = "DotKey";
static char *dotSizeKey = "redDotSize";
@interface UIView ()
@property (nonatomic, strong) UILabel *Dot;
@end

@implementation UIView (SLDot)

- (NSString *)dotMessage
{
    return objc_getAssociatedObject(self, &dotMessageKey);
}

- (void)setDotMessage:(NSString *)dotMessage
{
    objc_setAssociatedObject(self, &dotMessageKey, dotMessage, OBJC_ASSOCIATION_ASSIGN);
    
    if (dotMessage.length > 0) {
        self.Dot.hidden = NO;
        self.Dot.text = dotMessage;
    } else if (!(dotMessage.length > 0))
    {
        self.Dot.hidden = YES;
    }
}

- (UILabel *)Dot
{
    UILabel *ml = objc_getAssociatedObject(self, &DotKey);
    
    if (!ml) {
        ml = [[UILabel alloc] init];
        ml.backgroundColor = [UIColor clearColor];
        ml.frame = CGRectMake(self.frame.size.width-defualtDotSize, 0, defualtDotSize, defualtDotSize);
        ml.textColor = [UIColor whiteColor];
        ml.font = [UIFont systemFontOfSize:10];
        ml.textAlignment = NSTextAlignmentCenter;
        ml.layer.cornerRadius = defualtDotSize/2;
        ml.layer.backgroundColor = [UIColor redColor].CGColor;
        objc_setAssociatedObject(self, &DotKey, ml, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self addSubview:ml];
    }
    
    return ml;
}

- (void)setDotSize:(CGSize)dotSize
{
    objc_setAssociatedObject(self, &dotSizeKey, [NSValue valueWithCGSize:dotSize], OBJC_ASSOCIATION_ASSIGN);
    self.Dot.frame = CGRectMake(self.frame.size.width-dotSize.width, 0, dotSize.width, dotSize.height);
    [self roundCornerClip:dotSize.width/2];
}

- (CGSize)dotSize
{
    return [objc_getAssociatedObject(self, &dotSizeKey) CGSizeValue];
}

- (void)roundCornerClip:(CGFloat)radius
{
    NSLog(@"radius, %f", radius);
    self.Dot.layer.cornerRadius = radius;
}

- (void)setDotColor:(UIColor *)dotColor
{
    if (dotColor) {
        self.Dot.layer.backgroundColor = dotColor.CGColor;
    }
}

- (void)setEdgeInset:(CGPoint)edgeInset
{
    CGRect oldFrame = self.Dot.frame;
    oldFrame.origin.x = oldFrame.origin.x + edgeInset.x;
    oldFrame.origin.y = oldFrame.origin.y + edgeInset.y;
    self.Dot.frame = oldFrame;
}

- (void)setMessageFont:(UIFont *)messageFont
{
    self.Dot.font = messageFont;
}

@end
