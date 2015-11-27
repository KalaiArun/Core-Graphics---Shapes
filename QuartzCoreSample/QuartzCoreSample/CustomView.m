//
//  CustomView.m
//  QuartzCoreSample
//
//  Created by dev11 on 11/12/15.
//  Copyright (c) 2015 fsp. All rights reserved.
//
#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)
#import "CustomView.h"
//#import "UIBezierPath+Interpolation.h"

#import "CGutilities.h"

#if CGFLOAT_IS_DOUBLE
# define CGFloatValue	doubleValue
#else
# define CGFloatValue	floatValue
#endif

@implementation CustomView {

    float x;
    float y;
    CGMutablePathRef shapePath;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    
    x = [[UIScreen mainScreen] bounds].size.width;
    y = [[UIScreen mainScreen]bounds].size.height;
    
    NSArray *shapeCooridnates = [[NSArray alloc]initWithObjects:
                                 [NSValue valueWithCGRect:CGRectMake((100.00/375)*x,(175.00/667)*y, 0, 0)],
                                 [NSValue valueWithCGRect:CGRectMake((150.00/375)*x,(75.00/667)*y, 0, 0)],
                                 [NSValue valueWithCGRect:CGRectMake((200.00/375)*x,(75.00/667)*y, 0, 0)],
                                 [NSValue valueWithCGRect:CGRectMake((250.00/375)*x,(175.00/667)*y, 0, 0)],
                                 [NSValue valueWithCGRect:CGRectMake((200.00/375)*x,(275.00/667)*y, 0, 0)],
                                 [NSValue valueWithCGRect:CGRectMake((150.00/375)*x,(275.00/667)*y, 0, 0)], nil];
    
    shapePath = CGPathCreateMutable();
    NSValue *rectOnTheScreen = (shapeCooridnates[0]);
    
    CGPathMoveToPoint(shapePath, nil, rectOnTheScreen.CGRectValue.origin.x, rectOnTheScreen.CGRectValue.origin.y);
    
    for (int i = 1; i < shapeCooridnates.count; i++) {
        
        NSValue *currentValue = [shapeCooridnates objectAtIndex:i];
        CGPathAddLineToPoint(shapePath, nil, currentValue.CGRectValue.origin.x, currentValue.CGRectValue.origin.y);
        
    }
    
    CGPathCloseSubpath(shapePath);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    UIBezierPath* path = [UIBezierPath bezierPathWithCGPath:shapePath];
    
    
    //CGFloat tension = 0.044447;
    CGFloat tension = 0.1;
    
    //Normal path
    CGContextAddPath(ctx, shapePath);
    
    //Smooth curve
    //CGContextAddPath(ctx, [path smoothedBezierPathWithTension:tension].CGPath);
    
    CGContextDrawPath(ctx,kCGPathStroke);
    
}

@end
