//
//  ViewController.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "ViewController.h"
#import "CTDislayView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CTDislayView* displayView = [[CTDislayView alloc] initWithFrame:CGRectMake(100,200, 100, 300)];
    displayView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:displayView];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//    label.text = @"测试 ...";
//    label.attributedText = [[NSAttributedString alloc] initWithString:@"测试.." attributes:@{NSBackgroundColorAttributeName : [UIColor blueColor]}];
    label.attributedText = [[NSAttributedString alloc] initWithString:@"DJ奥利弗点击" attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInt:2]}];
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
