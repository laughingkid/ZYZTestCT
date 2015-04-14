//
//  CTFrameParserConfig.h
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTData.h"
#import "CTFrameParserConfig.h"

@interface CTFrameParserConfig : NSObject

+(CTData*)parserContent:(NSString*)content config:(CTFrameParserConfig*)config;


@end
