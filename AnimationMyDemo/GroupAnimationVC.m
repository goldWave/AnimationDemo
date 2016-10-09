//
//  GroupAnimationVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/9/30.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "GroupAnimationVC.h"

@interface GroupAnimationVC ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation GroupAnimationVC

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
        [clickBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
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
    return [NSArray arrayWithObjects:@"同时",@"连续", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self togetherAnimation];
            break;
        case 1:
            [self continueAnimation];
            break;
        default:
            break;
    }
}

- (void)togetherAnimation {
    CAKeyframeAnimation *anmi1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, 350)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(150, 350)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 450)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_Width, 250)];
    anmi1.values = @[value1, value2, value3, value4, value5, value6];
    
    CABasicAnimation *anmi2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anmi2.toValue = @(M_PI * 6);
    
    CABasicAnimation *anmi3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anmi3.toValue = @3.f;
    
    CABasicAnimation *anmi4 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anmi4.toValue = @0.2f;
    anmi4.duration = 3 / 3 ;
    anmi4.repeatCount = 3;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anmi1, anmi2, anmi3, anmi4];
    group.duration = 3;
    
    [self.demoView.layer addAnimation:group forKey:@"group"];
    
    //-------------如下，使用三个animation不分装成group，只是把他们添加到layer，也有组动画的效果。-------------
    //    //位移动画
    //    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-50)];
    //    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2-50)];
    //    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/2+50)];
    //    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2+50)];
    //    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH*2/3, SCREEN_HEIGHT/2-50)];
    //    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50)];
    //    anima1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    //    anima1.duration = 4.0f;
    //    [_demoView.layer addAnimation:anima1 forKey:@"aa"];
    //
    //    //缩放动画
    //    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    //    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    //    anima2.duration = 4.0f;
    //    [_demoView.layer addAnimation:anima2 forKey:@"bb"];
    //
    //    //旋转动画
    //    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    //    anima3.duration = 4.0f;
    //    [_demoView.layer addAnimation:anima3 forKey:@"cc"];
}

- (void)continueAnimation {
    /*   用组动画没做出来,以后再测
    CFTimeInterval currentTime = CACurrentMediaTime();
    
    CAKeyframeAnimation *anmi1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, 350)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(150, 350)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 450)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_Width, 250)];
    anmi1.beginTime =  currentTime;
    anmi1.duration = 1;
    anmi1.fillMode = kCAFillModeForwards;
    anmi1.removedOnCompletion = NO;
    anmi1.values = @[value1, value2, value3, value4, value5, value6];
    
    CABasicAnimation *anmi2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anmi2.duration = 1;
    anmi2.fillMode = kCAFillModeForwards;
    anmi2.removedOnCompletion = NO;
    anmi2.beginTime = currentTime+1.0f;
    anmi2.toValue = @(M_PI * 6);
    
    CABasicAnimation *anmi3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anmi3.duration = 1;
    anmi3.fillMode = kCAFillModeForwards;
    anmi3.removedOnCompletion = NO;
    anmi3.beginTime = currentTime+2.0f;
    anmi3.toValue = @3.f;
    
    CABasicAnimation *anmi4 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anmi4.duration = 1;
    //     anmi4.fillMode = kCAFillModeForwards;
    //    anmi4.removedOnCompletion = NO;
    anmi4.beginTime = currentTime+3.0f;
    anmi4.toValue = @0.2f;
    anmi4.duration = 1 ;
    //    anmi4.repeatCount = 3;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[anmi1, anmi2, anmi3, anmi4];
    group.duration = 4;
    [self.demoView.layer addAnimation:group forKey:@"group1"];
    */
    
    
    
        CFTimeInterval currentTime = CACurrentMediaTime();
    
        CAKeyframeAnimation *anmi1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
        NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, 350)];
        NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(150, 350)];
        NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(150, 450)];
        NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
        NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(SCREEN_Width, 250)];
        anmi1.beginTime =  currentTime;
        anmi1.duration = 4;
        anmi1.fillMode = kCAFillModeRemoved;
        anmi1.removedOnCompletion = YES;
        anmi1.values = @[value1, value2, value3, value4, value5, value6];
        [self.demoView.layer addAnimation:anmi1 forKey:@"position1"];
    
    
        CABasicAnimation *anmi2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        anmi2.duration = 1;
        anmi2.fillMode = kCAFillModeForwards;
        anmi2.removedOnCompletion = NO;
        anmi2.beginTime = currentTime+1.0f;
        anmi2.toValue = @(M_PI * 6);
        [self.demoView.layer addAnimation:anmi2 forKey:@"position2"];
    
        CABasicAnimation *anmi3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        anmi3.duration = 1;
        anmi3.fillMode = kCAFillModeForwards;
        anmi3.removedOnCompletion = NO;
        anmi3.beginTime = currentTime+2.0f;
        anmi3.toValue = @3.f;
        [self.demoView.layer addAnimation:anmi3 forKey:@"position3"];
    
        CABasicAnimation *anmi4 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        anmi4.duration = 1;
        anmi4.fillMode = kCAFillModeRemoved;
        anmi4.removedOnCompletion = YES;
        anmi4.beginTime = currentTime+3.0f;
        anmi4.toValue = @0.2f;
        anmi4.duration = 1 ;
        //    anmi4.repeatCount = 3;
        [self.demoView.layer addAnimation:anmi4 forKey:@"position4"];
    
    //为什么没有回去呢
}
@end
