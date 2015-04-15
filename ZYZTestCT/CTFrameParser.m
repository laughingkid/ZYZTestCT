//
//  CTFrameParserConfig.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "CTFrameParser.h"

@implementation CTFrameParser

+(CTData*)parserContent:(NSString *)content config:(CTFrameConfig *)config{
    NSDictionary* attributes = [[self class] attributesWithConfig:config];
    
    //创建属性字符串
    NSAttributedString* contentString = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    
    //创建 framesetter
    CTFramesetterRef theFrameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)contentString);
    
    //
    CGSize size = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(theFrameSetter, CFRangeMake(0, 0), NULL, size, nil);
    CGFloat textHeight = coreTextSize.height;
    
    
    //生成CTFrame实例
    CTFrameRef frameRef = [self createFrameWithFramesetter:theFrameSetter conig:config height:textHeight];
    
    //创建CTData
    CTData* data = [[CTData alloc] init];
    data.frame = frameRef;
    data.height = textHeight;
    
    CFRelease(frameRef);
    CFRelease(theFrameSetter);
    
    return data;
}


+(CTData*)parserAttributeString:(NSAttributedString *)attributString config:(CTFrameConfig *)config numOfLines:(NSInteger)lines{
    
//    NSDictionary* attributes = [[self class] attributesWithConfig:config];
    
    //创建 framesetter
    CTFramesetterRef theFrameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributString);

    
    CGRect rc = CGRectZero;
    
    CFRange range = CFRangeMake(0, 0);
    
    CTFrameRef frameRef;
    
    if (lines == 1) {
        rc.size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    }else{
        rc.size = CGSizeMake(config.width, CGFLOAT_MAX);
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, rc);
        
        //创建 CTFrame
        frameRef = CTFramesetterCreateFrame(theFrameSetter, CFRangeMake(0, 0), path, NULL);
        
        //    CGSize size = CGSizeMake(config.width, CGFLOAT_MAX);
        CFArrayRef lineArray = CTFrameGetLines(frameRef);
        
        if (lineArray != nil && CFArrayGetCount(lineArray) > 0) {
            NSInteger lastVisibleLineIndex = MIN(lines, CFArrayGetCount(lineArray)) - 1;
            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lineArray, lastVisibleLineIndex);
            
            CFRange rangToLayout = CTLineGetStringRange(lastVisibleLine);
            range = CFRangeMake(0, rangToLayout.location + rangToLayout.length);
            
        }
       
        CFRelease(path);
        CFRelease(frameRef);
    }
    
    
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(theFrameSetter, range, NULL, rc.size, nil);
    CGFloat textHeight = coreTextSize.height;
    //生成CTFrame实例
//    CTFrameRef frameRef = [self createFrameWithFramesetter:theFrameSetter conig:config height:textHeight];
    
    CGMutablePathRef pathToDisplay = CGPathCreateMutable();
    CGPathAddRect(pathToDisplay, NULL, CGRectMake(0, 0, config.width, textHeight));
    
    CTFrameRef frameToDisplay = CTFramesetterCreateFrame(theFrameSetter, range, pathToDisplay, NULL);
    
    //创建CTData
    CTData* data = [[CTData alloc] init];
    data.frame = frameToDisplay;
    data.height = textHeight;
    
    CFRelease(frameToDisplay);
    CFRelease(theFrameSetter);
    CFRelease(pathToDisplay);
    
    return data;

}


+(CTData*)parserAttributeString:(NSAttributedString*)attributString config:(CTFrameConfig*)config{
//    NSDictionary* attributes = [[self class] attributesWithConfig:config];
    
    //创建 framesetter
    CTFramesetterRef theFrameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributString);
    
    //
    CGSize size = CGSizeMake(config.width, CGFLOAT_MAX);
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(theFrameSetter, CFRangeMake(0, 0), NULL, size, nil);
    CGFloat textHeight = coreTextSize.height;
    
    
    //生成CTFrame实例
    CTFrameRef frameRef = [self createFrameWithFramesetter:theFrameSetter conig:config height:textHeight];
    
    //创建CTData
    CTData* data = [[CTData alloc] init];
    data.frame = frameRef;
    data.height = textHeight;
    
    CFRelease(frameRef);
    CFRelease(theFrameSetter);
    
    return data;

}

+(CTFrameRef)createFrameWithFramesetter:(CTFramesetterRef)framesetter conig:(CTFrameConfig*)confg height:(CGFloat)height{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL,CGRectMake(0, 0, confg.width, height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFRelease(path);
    return frame;
}

+(NSDictionary*)attributesWithConfig:(CTFrameConfig *)config{
//    kCTFontAttributeName
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"AriaMT", config.fontSize, NULL);
    
    CGFloat lineSpacing = config.lineSpace;
    const CFIndex kNumberofSettings = 3;
    CTParagraphStyleSetting theSettings[kNumberofSettings] = {
        { kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpacing },
        { kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpacing},
        { kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpacing}
    };
    
    CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberofSettings);
    
    UIColor* textColor = config.textColor;
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithCapacity:1];
    dic[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dic[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
    
    CFRelease(theParagraphRef);
    CFRelease(fontRef);

    return dic;
}



@end
