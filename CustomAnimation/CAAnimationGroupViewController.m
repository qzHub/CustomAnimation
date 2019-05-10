//
//  CAAnimationGroupViewController.m
//  UI_05_04
//
//  Created by cc on 16/2/18.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()
{
    CALayer *groupLayer;
    CAShapeLayer *_loadShapeLayer;
}

@end

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    groupLayer = [CALayer layer];
    groupLayer.frame = CGRectMake(150, 50, 50, 50);
    groupLayer.cornerRadius = 5;
    groupLayer.backgroundColor = [UIColor cyanColor].CGColor;
    [self.view.layer addSublayer:groupLayer];
    
    CAShapeLayer *bottomShapeLayer = [CAShapeLayer layer];
    bottomShapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    bottomShapeLayer.fillColor = [UIColor clearColor].CGColor;
    bottomShapeLayer.lineWidth = 5;
    
    UIBezierPath *bottomBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 350, 30, 30) cornerRadius:15];
    bottomShapeLayer.path = bottomBezierPath.CGPath;
    [self.view.layer addSublayer:bottomShapeLayer];
    
    _loadShapeLayer = [CAShapeLayer layer];
    _loadShapeLayer.strokeColor = [UIColor blackColor].CGColor;
    _loadShapeLayer.fillColor = [UIColor clearColor].CGColor;
    _loadShapeLayer.lineWidth = 5;
    _loadShapeLayer.lineCap = kCALineCapRound;
    _loadShapeLayer.path = bottomBezierPath.CGPath;
    [self.view.layer addSublayer:_loadShapeLayer];
    
    
    //延时代码块
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CALayer *layer = [CALayer layer];
        layer.backgroundColor = [UIColor blackColor].CGColor;
        layer.frame = CGRectMake(100, 100, 100, 100);
//        [self.view.layer addSublayer:layer];
    });
    
    
}

//动画1
- (IBAction)donghuaOne:(id)sender {

    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @1;
    scale.toValue = @2;
    scale.duration = 2;
    scale.repeatCount = 1;
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    move.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    move.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 300)];
    move.duration = 2;
    move.repeatCount = 1;
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = @0;
    rotation.toValue = @(M_PI*3);
    rotation.duration = 2;
    rotation.repeatCount = 1;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[scale,move,rotation];
    groupAnimation.duration = 10;
    groupAnimation.repeatCount = 1;
    [groupLayer addAnimation:groupAnimation forKey:nil];
    
    
}

//动画2
- (IBAction)donghuaTwo:(id)sender {
    
    //起始点
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @(-1);
    strokeStartAnimation.toValue = @1;
    strokeStartAnimation.duration = 1;
    strokeStartAnimation.delegate = self;
//    [_loadShapeLayer addAnimation:strokeStartAnimation forKey:@"strokeStart"];
    
    //结束点
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @(0);
    strokeEndAnimation.toValue = @1;
    strokeEndAnimation.duration = 1;
//    [_loadShapeLayer addAnimation:strokeEndAnimation forKey:@"strokeEnd"];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[strokeStartAnimation,strokeEndAnimation];
    animationGroup.duration = 1;
    animationGroup.repeatCount = CGFLOAT_MAX;
    [_loadShapeLayer addAnimation:animationGroup forKey:nil];
    
}

-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"开始");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"结束");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
