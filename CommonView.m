//
//  CommonView.m
//  UIBezierPath
//
//  Created by kim on 2018/10/11.
//  Copyright © 2018年 kedc. All rights reserved.
//

#import "CommonView.h"

@implementation CommonView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(200, 300) radius:50 startAngle:M_PI endAngle:M_PI * 2 clockwise:true];
    [[UIColor redColor] set];
    [path stroke];

}

@end
