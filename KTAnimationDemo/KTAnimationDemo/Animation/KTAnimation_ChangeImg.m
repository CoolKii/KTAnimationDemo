//
//  KTAnimation_ChangeImg.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTAnimation_ChangeImg.h"


//定义枚举类型
typedef enum {
    CurrentImageTypeEnumOne=0,//0
    CurrentImageTypeEnumTwo=1,//1
}CurrentImageType;


@interface KTAnimation_ChangeImg ()

@property (nonatomic , strong) UIImageView *wsView;

@property (nonatomic,assign) CurrentImageType CurrentImgType; //操作类型

@end



@implementation KTAnimation_ChangeImg

- (void)viewDidLoad {
    
    _CurrentImgType = CurrentImageTypeEnumOne;
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:@"img1"];
    [self.view addSubview:_wsView];
    
  
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, kScreenHeight - 100, kScreenWidth-100, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"切换图片" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction:(UIButton *)btn {
    
    if (_CurrentImgType == CurrentImageTypeEnumOne) {
        [self changeImageAnimatedWithView:_wsView AndImage:[UIImage imageNamed:@"img2"]];
        _CurrentImgType = CurrentImageTypeEnumTwo;
    }
    else {
        [self changeImageAnimatedWithView:_wsView AndImage:[UIImage imageNamed:@"img1"]];
        _CurrentImgType = CurrentImageTypeEnumOne;

    }
}
//动画切换图标
- (void)changeImageAnimatedWithView:(UIImageView *)imageV AndImage:(UIImage *)image {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [imageV.layer addAnimation:transition forKey:@"a"];
    [imageV setImage:image];
    
}

@end
