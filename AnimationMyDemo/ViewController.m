//
//  ViewController.m
//  AnimationMyDemo
//
//  Created by renjinbo on 16/9/30.
//  Copyright © 2016年 com.coffee.biggerapple.zxp. All rights reserved.
//

#import "ViewController.h"
#import "BaseAnimationVC.h"
#import "KeyAnimationVC.h"
#import "GroupAnimationVC.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航页";
    self.titles = @[@"基础动画", @"关键帧动画", @"组动画"];
    [self initTitleBtn];
    
}

- (void)initTitleBtn {
    for (int i = 0; i < self.titles.count; i ++) {
        UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        clickBtn.backgroundColor = [UIColor darkGrayColor];
        [clickBtn setTitle:self.titles[i] forState:UIControlStateNormal];
        [clickBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [clickBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        clickBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        clickBtn.frame = CGRectMake(20 + (i % 3) * 100, 300 + (i / 3) * 50 , 90, 20);
        clickBtn.tag = i;
        [self.view addSubview:clickBtn];
    }
}


-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
        {
            BaseAnimationVC *baseVC = [BaseAnimationVC new];
            baseVC.title = self.titles[btn.tag];
            [self.navigationController pushViewController:baseVC  animated:YES];
        }
            break;
        case 1:
        {
            KeyAnimationVC *keyVC = [KeyAnimationVC new];
            keyVC.title = self.titles[btn.tag];
            [self.navigationController pushViewController:keyVC  animated:YES];
        }
            break;
        case 2:
        {
            GroupAnimationVC *groupVC = [GroupAnimationVC new];
            groupVC.title = self.titles[btn.tag];
            [self.navigationController pushViewController:groupVC  animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
