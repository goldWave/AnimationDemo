//
//  BaseAnimationVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/9/30.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "BaseAnimationVC.h"

@interface BaseAnimationVC ()
@property (nonatomic, strong) UIView *demoView;

@end

@implementation BaseAnimationVC

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
    return [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
}
-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
            
        default:
            break;
    }
}
/*
animationWithKeyPath的值：

transform.scale = 比例轉換

transform.scale.x = 闊的比例轉換

transform.scale.y = 高的比例轉換

transform.rotation.z = 平面圖的旋轉

opacity = 透明度

margin

zPosition

backgroundColor    背景颜色

cornerRadius    圆角

borderWidth

bounds

contents

contentsRect

cornerRadius

frame

hidden

mask

masksToBounds

opacity

position

shadowColor

shadowOffset

shadowOpacity

shadowRadius
*/


//位移
- (void)positionAnimation {
    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, self.view.center.y)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_Width, self.view.center.y)];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @0;
    animation.toValue =@(SCREEN_Width);
    animation.duration = 2;
    //动画的  显示方式  快进慢出
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    /*
//    动画结束之后，动画界面又恢复动画前的状态。要想保持动画后的状态，可以有方式
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
     */
    [self.demoView.layer addAnimation:animation forKey:@"postionAnimation"];
}

//透明度
- (void)opacityAniamtion {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @1;
    animation.toValue = @0.1;
    animation.duration = 2;
    [self.demoView.layer addAnimation:animation forKey:@"opacity"];
}

//缩放
- (void)scaleAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animation.fromValue = @1;
    animation.toValue = @3;
    animation.duration = 2.0f;
    [self.demoView.layer addAnimation:animation forKey:@"scale"];
}

//旋转
- (void)rotateAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    animation.fromValue = @1;
    animation.toValue = @M_PI;
    animation.duration = 2.0f;
    [self.demoView.layer addAnimation:animation forKey:@"rotate"];
    
    
    //    //valueWithCATransform3D作用与layer
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
    //    anima.duration = 1.0f;
    //    //anima.repeatCount = MAXFLOAT;
    //    [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    //    //CGAffineTransform作用与View
    //    _demoView.transform = CGAffineTransformMakeRotation(0);
    //    [UIView animateWithDuration:1.0f animations:^{
    //        _demoView.transform = CGAffineTransformMakeRotation(M_PI);
    //    } completion:^(BOOL finished) {
    //        
    //    }];
}

//背景色
- (void)backgroundAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    animation.fromValue = (id)[UIColor blueColor].CGColor;
    animation.byValue = (id)[UIColor yellowColor].CGColor;
    animation.toValue = (id)[UIColor blackColor].CGColor;
    animation.duration = 2;
    [self.demoView.layer addAnimation:animation forKey:@"backgroundColor"];
}

@end
