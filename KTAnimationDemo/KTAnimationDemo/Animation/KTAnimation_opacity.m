//
//  KTAnimation_opacity.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTAnimation_opacity.h"

@interface KTAnimation_opacity ()
@property (nonatomic , strong) UIImageView *wsView;
@end

@implementation KTAnimation_opacity


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:imageName2];
    [self.view addSubview:_wsView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, kScreenHeight - 100, kScreenWidth-200, 40);
    btn.layer.cornerRadius = 5;
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"改变透明度" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];



}



- (void)btnAction:(UIButton *)btn {
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
//    anima.fillMode = kCAFillModeForwards;
//    anima.removedOnCompletion = NO;
    anima.duration = 1.0f;
    [_wsView.layer addAnimation:anima forKey:@"opacityAniamtion"];
    
    
}

@end
