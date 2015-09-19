//
//  BNRHypnosisterView.m
//  Hypnosister
//
//  Created by WuSongHua on 15-7-18.
//  Copyright (c) 2015年 WuSongHua. All rights reserved.
//

#import "BNRHypnosisterView.h"
@interface BNRHypnosisterView()
@property (strong,nonatomic)UIColor *circleColor;
@end

@implementation BNRHypnosisterView
-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;

    CGPoint center;
    
    center.x = bounds.origin.x+bounds.size.width/2.0;
    center.y = bounds.origin.y+bounds.size.height/2.0;
    
    float maxRadius = (MIN(bounds.size.width, bounds.size.height)/2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius-=20) {
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI *2.0 clockwise:YES];
    }
    
    path.lineWidth = 10 ;
    //[[UIColor lightGrayColor]setStroke];
    [self.circleColor setStroke];
    [path stroke];
    
#if 0
    UIImage *logoImage = [UIImage imageNamed:@"Homepwner"];
    [logoImage drawInRect:CGRectMake(0, center.y-bounds.size.width/2, bounds.size.width, bounds.size.width)];
#endif

    
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return  self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched",self);
    
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
    
}
-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end
