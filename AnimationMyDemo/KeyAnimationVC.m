//
//  KeyAnimationVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/9/30.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "KeyAnimationVC.h"

@interface KeyAnimationVC () <CAAnimationDelegate>
@property (nonatomic, strong) UIView *demoView;
@end

@implementation KeyAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initButton];
}
- (void)initButton {
    for (int i = 0; i < [[self operateTitleArray] count]; i ++) {
        UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        clickBtn.backgroundColor = [UIColor darkGrayColor];
        [clickBtn setTitle:[self operateTitleArray][i] forState:UIControlStateNormal];
        [clickBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clickBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        clickBtn.tag = i;
        clickBtn.frame = CGRectMake(20 + (i % 3) * 100, 500 + (i / 3) * 50, 80, 20);
        [self.view addSubview:clickBtn];
    }
    
    self.demoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.demoView.center = self.view.center;
    self.demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.demoView];
}
-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self keyAnimation];
            break;
        case 1:
            [self pathAnimation];
            break;
        case 2:
            [self shakeAnimation];
            break;
        default:
            break;
    }
}


//关键帧动画
- (void)keyAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(0, 150)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 250)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(250, 400)];
    NSValue *value7 = [NSValue valueWithCGPoint:CGPointMake(250, 200)];
    animation.values = @[value1, value2, value3, value4, value5, value6, value7];
    animation.duration = 3.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;//设置代理，可以检测动画的开始和结束
    [self.demoView.layer addAnimation:animation forKey:@"position"];
}


//Path动画
- (void)pathAnimation {
    CAKeyframeAnimation *anmi = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:80.f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    anmi.path = path.CGPath;
    anmi.duration = 2;
//    anmi.repeatCount = 3;
    [self.demoView.layer addAnimation:anmi forKey:@"path"];
}
- (void)shakeAnimation {
    CAKeyframeAnimation *anmi = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    NSValue *value1 = @(- 0.05);
    NSValue *value2 = @(0.05);
    NSValue *value3 = @(-0.05);
    anmi.duration = 0.1;
    anmi.repeatCount = 10;
    anmi.values = @[value1, value2, value3];
    [self.demoView.layer addAnimation:anmi forKey:@"shake"];
}


#pragma mark  - animation delegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"动画结束");
}
@end
