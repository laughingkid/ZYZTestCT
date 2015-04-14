//
//  CTFrameConfig.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "CTFrameConfig.h"

@implementation CTFrameConfig

-(instancetype)init{
    if (self = [super init]) {
        _fontSize = 10.f;
        _width = 200.f;
        _lineSpace = 8.0f;
        _textColor = [UIColor redColor];
    }
    return self;
}

@end
