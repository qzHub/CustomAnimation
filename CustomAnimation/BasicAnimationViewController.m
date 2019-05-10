//
//  BasicAnimationViewController.m
//  UI_05_04
//
//  Created by cc on 16/2/17.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()
{
    UIView *_animationView;
    UIView *_animationView1;
    UIView *_animationView2;
    UIView *_animationView3;
    
    CAShapeLayer *_layer;
}

@end

@implementation BasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animationView = [[UIView alloc]initWithFrame:CGRectMake(20, 60, 40, 40)];
    _animationView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_animationView];
    
    _layer = [CAShapeLayer layer];
    _layer.frame = CGRectMake(35, 100, 250, 250);
    _layer.strokeColor = [UIColor cyanColor].CGColor;
    _layer.lineWidth = 13;
    _layer.lineJoin = kCALineJoinRound;
//    _layer.lineCap = kCALineCapRound;
    _layer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:_layer];
    
}

//旋转
- (IBAction)rotationAction:(id)sender {
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = @(0); //从多少度开始
    rotation.toValue = @(M_PI_2);   //旋转多少度
    rotation.duration = 0.1;  //旋转时间
    rotation.repeatCount = CGFLOAT_MAX;   //旋转次数
    rotation.delegate = self;
    
    //控制动画的节奏
    /*

     kCAMediaTimingFunctionLinear 线性动画
     kCAMediaTimingFunctionEaseIn 先快后慢
     kCAMediaTimingFunctionEaseOut 先慢后快
     kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
     kCAMediaTimingFunctionDefault 默认，也属于中间比较快

     */
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    //CACurrentMediaTime() 为图层当前的时间
    rotation.beginTime = CACurrentMediaTime()+2; //2秒之后在执行动画
    [_animationView.layer addAnimation:rotation forKey:@"rotation"];
}

//位移
- (IBAction)translationAction:(id)sender {
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    translation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    translation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
    translation.duration = 2;
    translation.repeatCount = 1;
    
    //控制动画的节奏
    translation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_animationView.layer addAnimation:translation forKey:@"translation"];

}

//放大
- (IBAction)scaleAction:(id)sender {
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.fromValue = @(1);
    scale.toValue = @(2);
    scale.duration = 2;
    scale.repeatCount = 1;
    /*动画速度,何时快、慢
     (
     kCAMediaTimingFunctionLinear 线性（匀速）|
     kCAMediaTimingFunctionEaseIn 先慢|
     kCAMediaTimingFunctionEaseOut 后慢|
     kCAMediaTimingFunctionEaseInEaseOut 先慢 后慢 中间快|
     kCAMediaTimingFunctionDefault 默认|
     )
     */
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [_animationView.layer addAnimation:scale forKey:@"scale"];
    
}

//3D旋转
- (IBAction)rotation3DAction:(id)sender {
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    rotation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 1, 1, 1)]; //x y z
    rotation.duration = 2;
    rotation.repeatCount = 1;
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_animationView.layer addAnimation:rotation forKey:@"rotation3D"];
}

//3D位移
- (IBAction)translation3DAction:(id)sender {
    
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"transform"];
    translation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    translation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(150, 150, 0)];//0表示突出来的位置，即先到0的地方，在出发往150,150
    translation.duration = 2;
    translation.repeatCount = 1;
    translation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
     [_animationView.layer addAnimation:translation forKey:@"translation3D"];
}

//3D放大
- (IBAction)scale3DAction:(id)sender {
    
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    scale.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 2, 3)];
    scale.duration = 2;
    scale.repeatCount = 1;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_animationView.layer addAnimation:scale forKey:@"scale"];
}

//opacity
- (IBAction)opacityAction:(id)sender {
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacity.fromValue = @(1);
    opacity.toValue = @(0.5);
    opacity.duration = 2;
    opacity.repeatCount = 1;
    opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_animationView.layer addAnimation:opacity forKey:@"opacity"];
    
}

//Path
- (IBAction)path:(id)sender {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    //贝塞尔曲线
    [bezierPath moveToPoint:CGPointMake(35, 400)];
    [bezierPath addLineToPoint:CGPointMake(35, 200)];
    [bezierPath addLineToPoint:CGPointMake(200, 200)];
    [bezierPath addLineToPoint:CGPointMake(200, 400)];
    [bezierPath addLineToPoint:CGPointMake(35, 400)];
    [bezierPath closePath];
    _layer.path = bezierPath.CGPath;
    
    //路径动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.fromValue = @0;
    pathAnimation.toValue = @1;
    pathAnimation.duration = 5;
    pathAnimation.repeatCount = 1;
//    [_layer addAnimation:pathAnimation forKey:@"strokePathAnimation"];
    
    //宽度变化动画
    CABasicAnimation *widthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    widthAnimation.fromValue = @13;
    widthAnimation.toValue = @30;
    widthAnimation.duration = 5;
//    [_layer addAnimation:widthAnimation forKey:@"lineWidth"];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[pathAnimation,widthAnimation];
    animationGroup.duration = 5;
    animationGroup.repeatCount = 1;
    [_layer addAnimation:animationGroup forKey:nil];
    _layer.lineWidth = 30;  //上面的动画执行完后执行这段
    
}


#pragma mark---------------------------------
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"animationDidStop");
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
