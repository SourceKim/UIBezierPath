//
//  WaterProgress.m
//  UIBezierPath
//
//  Created by kim on 2018/10/11.
//  Copyright © 2018年 kedc. All rights reserved.
//

#import "WaterProgress.h"

@implementation WaterProgress {
    UIBezierPath *_path;
    CAShapeLayer *_layer;

    int _sinControl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.layer.cornerRadius = frame.size.height / 2;
        self.clipsToBounds = true;
        self.backgroundColor = [UIColor lightGrayColor];

        self.currentProgress = 0;
        _sinControl = 0;
        _path = [UIBezierPath bezierPath];

        _layer = [CAShapeLayer layer];
        _layer.frame = self.bounds;
        [self.layer addSublayer: _layer];

        CADisplayLink *timer = [CADisplayLink displayLinkWithTarget: self selector:@selector(update)];

        timer.preferredFramesPerSecond = 8;
        [timer addToRunLoop:[NSRunLoop currentRunLoop] forMode: NSRunLoopCommonModes];

    }
    return self;
}

- (void)update {

    float percent = (float)self.currentProgress / 100.0;

    [_path removeAllPoints];

    CGFloat radius = self.bounds.size.height / 2;

    CGPoint pointA = CGPointMake(radius, self.bounds.size.height * (1 - percent));
    CGFloat d_A_to_center = fabs(pointA.y - radius);

    // 求出当前 progress 的横线
    CGFloat horizonLineLength_half = sqrtf(radius * radius - d_A_to_center * d_A_to_center);

    CGPoint startPoint = CGPointMake(pointA.x - horizonLineLength_half, pointA.y);

    [_path moveToPoint:startPoint];

    CGFloat wave_len = 2 * M_PI / ((arc4random() % 10) + 50); // 波长
    // y = 振幅 * sin(bx + c)
    // 波长 = 2π / b
    for (int i=0; i<horizonLineLength_half*2;i++) {

        [_path addLineToPoint: CGPointMake(i + radius - horizonLineLength_half, 3 * sinf(i * wave_len + _sinControl) + pointA.y)];
        
    }



    _sinControl += 1;

    CGFloat startAngle, endAngle;

    startAngle = asin((pointA.y - radius) / radius);
    endAngle = asin((radius - startPoint.x) / radius) + M_PI / 2;

    if (pointA.y < radius) {
        // 在圆心之上
        endAngle = acos((radius - startPoint.x) / radius) + M_PI;
    }


    [_path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle: startAngle endAngle:endAngle clockwise: true];
    _layer.path = [_path CGPath];
    _layer.strokeColor = [[UIColor blueColor] CGColor];
    _layer.fillColor = [[UIColor blueColor] CGColor];


}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2) radius: rect.size.width / 2 - 1 startAngle:0 endAngle:M_PI * 2 clockwise:true];
//
//    [[UIColor blueColor] set];
//    [path stroke];
//
//    [[UIColor whiteColor] set];
//    [path fill];
}

@end
