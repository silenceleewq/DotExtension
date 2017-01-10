//
//  UIView+SLDot.m
//  RedDotTest
//
//  Created by lirenqiang on 2017/1/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "UIView+SLDot.h"
#import <objc/runtime.h>

#define AUTO_LAYOUT_MACRO

#define defualtDotSize 20

@interface UIView ()
@property (nonatomic, strong) UILabel *Dot;
@end

@implementation UIView (SLDot)

- (NSString *)sl_dotMessage
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSl_dotMessage:(NSString *)sl_dotMessage
{
    objc_setAssociatedObject(self, @selector(sl_dotMessage), sl_dotMessage, OBJC_ASSOCIATION_ASSIGN);
    
    if (sl_dotMessage.length > 0) {
        if ([sl_dotMessage isEqualToString:@"0"]) {
            self.Dot.text = @"";
        } else {
            self.Dot.text = sl_dotMessage;
        }
        self.Dot.hidden = NO;
    } else if (!(sl_dotMessage.length > 0))
    {
        self.Dot.hidden = YES;
    }
}

- (UILabel *)Dot
{
    UILabel *ml = objc_getAssociatedObject(self, _cmd);
    
    if (!ml) {
        ml = [[UILabel alloc] init];
        [self addSubview:ml];
        ml.backgroundColor = [UIColor clearColor];
#ifdef AUTO_LAYOUT_MACRO
        [ml mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.right.equalTo(self);
            make.width.height.equalTo(defualtDotSize);
        }];
#else
        ml.frame = CGRectMake(self.frame.size.width-defualtDotSize, 0, defualtDotSize, defualtDotSize);
#endif
        ml.textColor = [UIColor whiteColor];
        ml.font = [UIFont systemFontOfSize:10];
        ml.textAlignment = NSTextAlignmentCenter;
        ml.layer.cornerRadius = defualtDotSize/2;
        ml.layer.backgroundColor = [UIColor redColor].CGColor;
        objc_setAssociatedObject(self, @selector(Dot), ml, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    return ml;
}

- (void)setSl_dotSize:(CGSize)sl_dotSize
{
    objc_setAssociatedObject(self, @selector(sl_dotSize), [NSValue valueWithCGSize:sl_dotSize], OBJC_ASSOCIATION_ASSIGN);
    self.Dot.frame = CGRectMake(self.frame.size.width-sl_dotSize.width, 0, sl_dotSize.width, sl_dotSize.height);
    [self roundCornerClip:sl_dotSize.width/2];
}

- (CGSize)sl_dotSize
{
    return [objc_getAssociatedObject(self, _cmd) CGSizeValue];
}

- (void)roundCornerClip:(CGFloat)radius
{
    NSLog(@"radius, %f", radius);
    self.Dot.layer.cornerRadius = radius;
}

- (void)setSl_dotColor:(UIColor *)sl_dotColor
{
    objc_setAssociatedObject(self, @selector(sl_dotColor), sl_dotColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (sl_dotColor) {
        self.Dot.layer.backgroundColor = sl_dotColor.CGColor;
    }
}

- (UIColor *)sl_dotColor
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSl_dotEdgeInset:(CGPoint)sl_dotEdgeInset
{
    objc_setAssociatedObject(self, @selector(sl_dotEdgeInset), [NSValue valueWithCGPoint:sl_dotEdgeInset], OBJC_ASSOCIATION_ASSIGN);
    
#ifdef AUTO_LAYOUT_MACRO
    CGFloat dotWidth = self.sl_dotSize.width > 0 ? self.sl_dotSize.width: defualtDotSize;
    [self.Dot remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(sl_dotEdgeInset.x);
        make.top.equalTo(self).offset(sl_dotEdgeInset.y);
        make.height.width.equalTo(dotWidth);
    }];
#else
    CGRect oldFrame = self.Dot.frame;
    oldFrame.origin.x = oldFrame.origin.x + sl_dotEdgeInset.x;
    oldFrame.origin.y = oldFrame.origin.y + sl_dotEdgeInset.y;
    self.Dot.frame = oldFrame;
#endif

}

- (CGPoint)sl_dotEdgeInset
{
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setSl_messageFont:(UIFont *)sl_messageFont
{
    objc_setAssociatedObject(self, @selector(sl_messageFont), sl_messageFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.Dot.font = sl_messageFont;
}

- (UIFont *)sl_messageFont
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setUseAutoLayout:(BOOL)useAutoLayout
{
    objc_setAssociatedObject(self, @selector(isUseAutoLayout), [NSNumber numberWithBool:useAutoLayout], OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isUseAutoLayout
{

    return objc_getAssociatedObject(self, _cmd);
}

@end
