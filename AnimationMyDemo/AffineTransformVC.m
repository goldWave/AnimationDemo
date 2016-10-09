//
//  AffineTransformVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/10/7.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "AffineTransformVC.h"

@interface AffineTransformVC ()
@property (nonatomic, strong) UIView *demoView;
@end

@implementation AffineTransformVC

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
    return [NSArray arrayWithObjects:@"位移",@"缩放",@"旋转",@"组合",@"反转", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotateAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self invertAnimation];
            break;
        default:
            break;
    }
}

- (void)positionAnimation {
    self.demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        self.demoView.transform = CGAffineTransformMakeTranslation(100, 100);
    }];
}
- (void)scaleAnimation {
    self.demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        self.demoView.transform = CGAffineTransformMakeScale(0.1, 1.3);
    }];
}
- (void)rotateAnimation {
    self.demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        self.demoView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}
//仿射变换的组合使用
- (void)combinationAnimation {
    self.demoView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1 animations:^{
        //method 1
//        self.demoView.transform = CGAffineTransformMakeTranslation(100, 100);
//        self.demoView.transform = CGAffineTransformMakeScale(0.1, 1.3);
//        self.demoView.transform = CGAffineTransformMakeRotation(M_PI);
        
        //metod 2
        CGAffineTransform form1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform form2 = CGAffineTransformScale(form1, 0.1, 1.3);
        CGAffineTransform form3 = CGAffineTransformTranslate(form2, 100, 100);
        
        self.demoView.transform = form3;
    }];

}

//矩阵反转
- (void)invertAnimation {
    self.demoView.transform = CGAffineTransformIdentity;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    //method 1
//    self.demoView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    
    //method 2
    self.demoView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2)); //扩大两倍,变成缩小两倍
    [UIView commitAnimations];
}
@end
