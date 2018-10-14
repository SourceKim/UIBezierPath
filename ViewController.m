//
//  ViewController.m
//  UIBezierPath
//
//  Created by kim on 2018/10/11.
//  Copyright © 2018年 kedc. All rights reserved.
//

#import "ViewController.h"
#import "CommonView.h"
#import "WaterProgress.h"

@interface ViewController ()

@property (nonatomic, strong) WaterProgress * waterProgress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    CommonView *view = [[CommonView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview: view];

//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path addArcWithCenter:CGPointMake(200, 300) radius:50 startAngle:M_PI endAngle:M_PI * 2 clockwise:true];
//
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = [path CGPath];
//    layer.strokeColor = [[UIColor redColor] CGColor];
//    layer.fillColor = [[UIColor whiteColor] CGColor];
//    [self.view.layer addSublayer: layer];

    self.waterProgress = [[WaterProgress alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    self.waterProgress.center = self.view.center;
    [self.view addSubview: self.waterProgress];

    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 120, 30)];
    slider.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
    [slider addTarget: self action: @selector(sliderChange:)  forControlEvents: UIControlEventValueChanged];
    [self.view addSubview: slider];
    slider.value = 0.3;

    self.waterProgress.currentProgress = 30;

}

- (void)sliderChange:(UISlider*)slider {

    self.waterProgress.currentProgress = slider.value * 100;

}

- (void)viewDidAppear:(BOOL)animated {

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
