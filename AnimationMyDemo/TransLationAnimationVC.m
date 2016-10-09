//
//  TransLationAnimationVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/10/7.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "TransLationAnimationVC.h"

@interface TransLationAnimationVC ()
@property (nonatomic, strong) UIView *demoView;
@property (nonatomic, strong) UILabel *demoLabel;
@property (nonatomic, assign) NSInteger index;
@end

@implementation TransLationAnimationVC


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
        clickBtn.frame = CGRectMake(40 + (i % 3) * 100, 450 + (i / 3) * 50, 80, 20);
        [self.view addSubview:clickBtn];
    }
    
    self.index = 0;
    
    self.demoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 300)];
    self.demoView.center = CGPointMake(self.view.center.x, self.view.center.y - 100);
    self.demoView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.demoView];
    
    self.demoLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 150, 100, 40)];
    self.demoLabel.text = @"1";
    self.demoLabel.textAlignment = NSTextAlignmentCenter;
    self.demoLabel.font = [UIFont systemFontOfSize:25];
    [self.demoView addSubview:self.demoLabel];
}
-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"curl",@"unCurl",@"caOpen",@"caClose", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveinAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleAnimation];
            break;
        case 8:
            [self curlAnimation];
            break;
        case 9:
            [self unCurlAnimation];
            break;
        case 10:
            [self caOpenAnimation];
            break;
        case 11:
            [self caCloseAnimation];
            break;
        default:
            break;
    }
}

//-----------------------------public api------------------------------------
/*
 type:
 kCATransitionFade;
 kCATransitionMoveIn;
 kCATransitionPush;
 kCATransitionReveal;
 */
/*
 subType:
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 */


/*
1. 单视图
+ (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

参数说明：
duration：动画的持续时间
view：需要进行转场动画的视图
options：转场动画的类型
animations：将改变视图属性的代码放在这个block中
completion：动画结束后，会自动调用这个block
2. 双视图
+ (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completion;

参数说明：
duration：动画的持续时间
options：转场动画的类型
animations：将改变视图属性的代码放在这个block中
completion：动画结束后，会自动调用这个block

文／Ljson（简书作者）
原文链接：http://www.jianshu.com/p/ee2d3a8b2d67
*/

- (void)fadeAnimation {
    CATransition *transtion = [CATransition animation];
    transtion.type = kCATransitionFade;
    transtion.subtype = kCATransitionFromRight;
    transtion.duration = 1;
    [self changeDemoView:YES];
    [self.demoView.layer addAnimation:transtion forKey:@"fade"];
    
    //字体反应速度  有点问题
//    [UIView transitionWithView:self.demoView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//        [self changeDemoView:YES];
//    } completion:nil];
}
- (void)moveinAnimation {
    CATransition *transtion = [CATransition animation];
    transtion.type = kCATransitionMoveIn;
    transtion.subtype = kCATransitionFromRight;
    transtion.duration = 1;
    [self changeDemoView:YES];
    [self.demoView.layer addAnimation:transtion forKey:@"MoveIn"];
}
- (void)pushAnimation {
    CATransition *transtion = [CATransition animation];
    transtion.type = kCATransitionPush;
    transtion.subtype = kCATransitionFromRight;
    transtion.duration = 1;
    [self changeDemoView:YES];
    [self.demoView.layer addAnimation:transtion forKey:@"Push"];
}
- (void)revealAnimation {
    CATransition *transtion = [CATransition animation];
    transtion.type = kCATransitionReveal;
    transtion.subtype = kCATransitionFromRight;
    transtion.duration = 1;
    [self changeDemoView:YES];
    [self.demoView.layer addAnimation:transtion forKey:@"Reveal"];
}

/* ------------------------------------------------------------------------
Don't be surprised if Apple rejects your app for including those effects,
and especially don't be surprised if your app starts behaving strangely after an OS update.
 */

- (void)cubeAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
        [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"cube"];
}
- (void)suckAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"suckEffect"];
}
- (void)oglFlipAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"oglFlip"];
}
- (void)rippleAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"rippleEffect"];
}
- (void)curlAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"pageCurl"];
}
- (void)unCurlAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"pageUnCurl"];
}
- (void)caOpenAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"cameraIrisHollowOpen"];
}
- (void)caCloseAnimation {
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";//设置动画的类型
    anima.subtype = kCATransitionFromRight; //设置动画的方向
    anima.duration = 1.0f;
    [self changeDemoView:YES];
    [_demoView.layer addAnimation:anima forKey:@"cameraIrisHollowClose"];
}

- (void)changeDemoView:(BOOL)isUp {
    
    if (self.index > 3) {
        self.index = 0;
    }
    if (self.index < 0) {
        self.index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    self.demoView.backgroundColor = colors[self.index];
    self.demoLabel.text = titles[self.index];
    if (isUp) {
        self.index++;
    }else{
        self.index--;
    }
}
@end
