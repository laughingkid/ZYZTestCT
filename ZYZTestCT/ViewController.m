//
//  ViewController.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "ViewController.h"
#import "CTDislayView.h"
#import "CTFrameConfig.h"
#import "CTData.h"
#import "CTFrameParser.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSString* content = @"移动外设公司 Lunatik 推出了 Epik 系列 Apple Watch 保护套, 可谓是目前最大的 Apple Watch 保护套, 🍎🇨🇳🇯🇵🇬🇧🇫🇷😊热天天😊";
    
    
    CTFrameConfig* config = [[CTFrameConfig alloc] init];
    config.textColor = [UIColor purpleColor];
    config.width     = 100.f;
    config.fontSize  = 12.f;
    
    
    NSDictionary* attributes = [CTFrameParser attributesWithConfig:config];
    
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
    
    [attributeString addAttribute:(id)kCTForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [attributeString addAttribute:(id)kCTStrokeWidthAttributeName value:[NSNumber numberWithInt:3.f] range:NSMakeRange(0, 5)];
    [attributeString addAttribute:(id)kCTFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, attributeString.length)];
    
//    CTData* data = [CTFrameParser parserAttributeString:attributeString config:config];
    CTData* data = [CTFrameParser parserAttributeString:attributeString config:config numOfLines:5];
    
    CTDislayView* displayView = [[CTDislayView alloc] initWithFrame:CGRectMake(100,200, 100, data.height)];
    displayView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    displayView.data = data;
    [self.view addSubview:displayView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
