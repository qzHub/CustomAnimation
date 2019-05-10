//
//  KeyframeAnimationViewController.m
//  UI_05_04
//
//  Created by cc on 16/2/18.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "KeyframeAnimationViewController.h"

@interface KeyframeAnimationViewController ()
{
    UIView *_animationView;
    
    UIView *_animationView1;
}

@end

@implementation KeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animationView = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, 100, 200, 30)];
    _animationView.backgroundColor = [UIColor redColor];
    _animationView.layer.cornerRadius = 5.0;
    _animationView.layer.masksToBounds = YES;
    
    [self.view addSubview:_animationView];
    
    _animationView1 = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    _animationView1.backgroundColor = [UIColor redColor];
    _animationView1.layer.cornerRadius = 20;
    _animationView1.layer.masksToBounds = YES;
    
    [self.view addSubview:_animationView1];
    
}

//震动动画
- (IBAction)shakeAction:(id)sender {
    
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];  //position.x 位置
    shake.values = @[@0,@(-50),@(50),@(-50),@(50),@(0)];
    shake.duration = 0.5;
    shake.repeatCount = 1;
    shake.additive = YES; //以当前位置作震动
    
    [_animationView.layer addAnimation:shake forKey:@"shakeAnimation"];
    
}

//路径动画
- (IBAction)pathAction:(id)sender {
    
    CAKeyframeAnimation *path = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGRect rect = CGRectMake(0, 200, 100, 100); //画椭圆
    path.path = CGPathCreateWithEllipseInRect(rect, NULL);
    path.duration = 3;
    path.repeatCount = 5;
    path.additive = YES; //当前位置开始动画
    
    [_animationView1.layer addAnimation:path forKey:@"pathAnimation"];
    
}

//路径动画2
- (IBAction)pathActionTwo:(id)sender {
    
    // create a CGPath that implements two arcs (a bounce)
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,74.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,74.0,500.0,
                          320.0,500.0,
                          320.0,74.0);
    CGPathAddCurveToPoint(thePath,NULL,320.0,500.0,
                          566.0,500.0,
                          566.0,74.0);
    
    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
    theAnimation.duration=5.0;
    
    // Add the animation to the layer.
    [_animationView1.layer addAnimation:theAnimation forKey:@"position"];
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
