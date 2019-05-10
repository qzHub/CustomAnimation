//
//  CATransactionViewController.m
//  UI_05_04
//
//  Created by cc on 16/2/18.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "CATransactionViewController.h"

@interface CATransactionViewController ()
{
    CALayer *_cATransactionLayer;
}

@end

@implementation CATransactionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cATransactionLayer = [CALayer layer];
    _cATransactionLayer.backgroundColor = [UIColor yellowColor].CGColor;
    _cATransactionLayer.frame = CGRectMake(100, 100, 40, 40);
    [self.view.layer addSublayer:_cATransactionLayer];
    
}

//移动动画
- (IBAction)moveAction:(id)sender {
    
    [CATransaction begin];
    [CATransaction setValue:@1 forKey:kCATransactionAnimationDuration];
    CGFloat pointY =  _cATransactionLayer.position.y > 200?100:300;
    _cATransactionLayer.position = CGPointMake(_cATransactionLayer.position.x, pointY);
    [CATransaction commit];
    
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
