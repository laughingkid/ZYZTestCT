//
//  CTFrameConfig.h
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
@interface CTFrameConfig : NSObject

@property(nonatomic,assign)CGFloat  width;
@property(nonatomic,assign)CGFloat  fontSize;

@property(nonatomic,assign)CGFloat lineSpace;
@property(nonatomic,strong)UIColor* textColor;


@end
