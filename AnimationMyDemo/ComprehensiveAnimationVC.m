//
//  ComprehensiveAnimationVC.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/10/9.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "ComprehensiveAnimationVC.h"
#import "PathRoundImageView.h"

@interface ComprehensiveAnimationVC () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIButton  *pathBtn;
@property (nonatomic, strong) UIView *tempView;
@end

@implementation ComprehensiveAnimationVC


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
    
    self.tempView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.tempView.backgroundColor = [UIColor lightGrayColor];
    self.tempView.hidden = YES;
    [self.view addSubview:self.tempView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTapGesture:)];
    tap.delegate = self;
    [self.tempView addGestureRecognizer:tap];
    
    self.pathBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pathBtn setImage:[UIImage imageNamed:@"chooser-button-input"] forState:UIControlStateNormal];
    [self.pathBtn setImage:[UIImage imageNamed:@"chooser-button-input-highlighted"] forState:UIControlStateHighlighted];
    self.pathBtn.frame = CGRectMake(SCREEN_Width * 0.5 - 15, 400, 30, 30);
    self.pathBtn.layer.borderWidth = 1;
    self.pathBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.pathBtn.layer.cornerRadius = self.pathBtn.frame.size.width * 0.5;
    self.pathBtn.clipsToBounds = YES;
    [self.pathBtn addTarget:self action:@selector(pathButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pathBtn];
    
    

    
}

- (void)tapTapGesture:(UITapGestureRecognizer *)tap {
    self.tempView.hidden = YES;
    
}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"path",@"钉钉",@"点赞", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self pathAnimation];
            break;
        case 1:
            [self dingDingAnimation];
            break;
        case 2:
            [self clickGoodAnimation];
            break;
        default:
            break;
    }
}

- (void)pathButtonAction {
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = self.pathBtn.frame;
    [button1 setImage:[UIImage imageNamed:@"chooser-moment-icon-music"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"] forState:UIControlStateHighlighted];
    button1.layer.borderWidth = 1;
    button1.backgroundColor = [UIColor whiteColor];
    button1.layer.borderColor = [UIColor whiteColor].CGColor;
    button1.layer.cornerRadius = button1.frame.size.width * 0.5;
    button1.clipsToBounds = YES;
    [self.view addSubview:button1];
    
    
    self.tempView.hidden = NO;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    CGAffineTransform form1 = CGAffineTransformMakeScale(1.5, 1.5);
    CGAffineTransform form2 = CGAffineTransformRotate(form1, M_PI);
    CGAffineTransform form3 = CGAffineTransformTranslate(form2, 40, 100);
    button1.transform = form3;
    [UIView commitAnimations];
    
}


- (void)pathAnimation {
//    self.demoView.transform = CGAffineTransformIdentity;
//    [UIView animateWithDuration:1 animations:^{
//        self.demoView.transform = CGAffineTransformMakeTranslation(100, 100);
//    }];
//    self.tempView.hidden = NO;
}


#pragma mark  - dingding

- (void)dingDingAnimation {
//    self.demoView.transform = CGAffineTransformIdentity;
//    [UIView animateWithDuration:1 animations:^{
//        self.demoView.transform = CGAffineTransformMakeScale(0.1, 1.3);
//    }];
}

#pragma mark  - good
- (void)clickGoodAnimation {

}

@end
