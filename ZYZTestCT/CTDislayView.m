//
//  CTDislayView.m
//  ZYZTestCT
//
//  Created by yinzezhang on 15/4/14.
//  Copyright (c) 2015年 yinzezhang. All rights reserved.
//

#import "CTDislayView.h"
#import <CoreText/CoreText.h>
@implementation CTDislayView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.data) {
        CTFrameDraw(self.data.frame, context);
    }
    
    
  //测试attributestring
/*  测试 attributeString
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//    
//    NSMutableAttributedString* attstring = [[NSMutableAttributedString alloc] initWithString:@"Hello World"
//                                     "放大镜浪费坚决反对,fda j"
//                                     "fjd al fdjask 发动机爱上了"
//                                     "fewioqj∆∆˚¬˙ß"
//       
//                                            "🍎🐂⬆️"];
//    //ok
//    [attstring addAttribute:NSForegroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(0, 5)];
//    
//    [attstring addAttribute:NSBackgroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 5)];
//    
//    //ok
//    [attstring addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(6, 5)];
//    
//    [attstring addAttribute:NSLigatureAttributeName value:[NSNumber numberWithInteger:3] range:NSMakeRange(11, 1)];
//    
//    // ok
//    [attstring addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:3.0] range:NSMakeRange(13, 2)];
//    
//    [attstring addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger:3] range:NSMakeRange(15, 2)];
//    [attstring addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:NSMakeRange(15 , 2)];
//    
//    
//    //ok
//    [attstring addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:3] range:NSMakeRange(17, 2)];
//   
//    //ok  空心
//    [attstring addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:5.f] range:NSMakeRange(21, 2)];
//    
//    NSShadow* shadow = [[NSShadow alloc] init];
//    shadow.shadowBlurRadius = 0.f;
//    shadow.shadowOffset = CGSizeMake(2.f, 0.f);
//    shadow.shadowColor = [UIColor purpleColor];
//    [attstring addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(24, 4)];
//    
//    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attstring);
//    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, [attstring length]), path, NULL);
//    
//    CTFrameDraw(frame, context);
//    
//    CFRelease(frame);
//    CFRelease(frameSetter);
//    CFRelease(path);
 */
}


@end
