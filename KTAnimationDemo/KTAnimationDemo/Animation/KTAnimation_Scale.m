//
//  KTAnimation_Scale.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTAnimation_Scale.h"

@interface KTAnimation_Scale ()

@property (nonatomic , strong) UIImageView *wsView;

@end

@implementation KTAnimation_Scale


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:imageName2];
    [self.view addSubview:_wsView];
    
    
    NSArray *titleArr = @[@"缩放",@"X缩放",@"Y缩放"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 150 +60*(i/4), (kScreenWidth-100)/4, 40);
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.tag = i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
}



- (void)btnAction:(UIButton *)btn {
    
    switch (btn.tag) {
        case 0:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_wsView.layer addAnimation:anima forKey:@"scaleAnimation"];
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];//同上
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_wsView.layer addAnimation:anima forKey:@"scaleAnimationX"];
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];//同上
            anima.toValue = [NSNumber numberWithFloat:2.0f];
            anima.duration = 1.0f;
            [_wsView.layer addAnimation:anima forKey:@"scaleAnimationY"];
        }
            break;

        default:
            break;
    }
    
}



@end
