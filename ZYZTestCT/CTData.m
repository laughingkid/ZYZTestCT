//
//  CTData.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "CTData.h"

@implementation CTData

-(void)dealloc{
    CFRelease(_frame);
}

-(void)setFrame:(CTFrameRef )frame{
    if (_frame != frame) {
        if (_frame != NULL) {
            CFRelease(_frame);
        }
        _frame = CFRetain(frame);
    }
}

@end
