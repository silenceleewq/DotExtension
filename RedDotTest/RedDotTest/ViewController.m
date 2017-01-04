//
//  ViewController.m
//  RedDotTest
//
//  Created by lirenqiang on 2017/1/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "ViewController.h"
#import "RedDotView.h"
#import "UIView+SLDot.h"
@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@property (weak, nonatomic) IBOutlet UITextField *tf;
@end

@implementation ViewController {
    RedDotView *_redDotView;
    RedDotView *_redDotView2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _redDotView = [[RedDotView alloc] initWithMaxDistance:500 bubbleColor:[UIColor redColor]];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
    
    self.btn.backgroundColor = [UIColor greenColor];
    self.btn.dotColor = [UIColor blackColor];
    self.btn.messageCount = 0;
    self.btn.dotSize = CGSizeMake(10, 10);
    
    [self.view addSubview:self.btn];
    
    [_redDotView attach:self.btn withSeparateBlock:^BOOL(UIView *view) {
        NSLog(@"红色消失: %@", view);
        return YES;
    }];
    
    NSLog(@"btn.message: %zd", self.btn.messageCount);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.btn.messageCount = self.tf.text.integerValue;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
