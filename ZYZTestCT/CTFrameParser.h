//
//  CTFrameParserConfig.h
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTData.h"
#import "CTFrameConfig.h"

@interface CTFrameParser : NSObject

+(CTData*)parserContent:(NSString*)content config:(CTFrameConfig*)config;
+(CTData*)parserAttributeString:(NSAttributedString*)attributString config:(CTFrameConfig*)config;
+(CTData*)parserAttributeString:(NSAttributedString *)attributString config:(CTFrameConfig *)config numOfLines:(NSInteger)lines;
+(NSDictionary*)attributesWithConfig:(CTFrameConfig *)config;
@end
