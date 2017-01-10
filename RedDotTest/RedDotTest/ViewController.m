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
    
//    self.btn = [[UIButton alloc] init];
//    self.btn.messageFont = [UIFont systemFontOfSize:10];
//    self.btn.backgroundColor = [UIColor blueColor];
//    self.btn.dotMessage = @"123";
//    self.btn.edgeInset = CGPointMake(10, -10);
//    [self.view addSubview:self.btn];
    
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor greenColor];
    [self.view addSubview:v];
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(100);
        make.center.equalTo(self.view);
    }];
    v.sl_dotMessage = @"1";
    v.sl_dotEdgeInset = CGPointMake(5, -5);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.btn.sl_dotMessage = self.tf.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
