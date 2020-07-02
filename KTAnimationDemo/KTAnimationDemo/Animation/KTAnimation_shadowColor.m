//
//  KTAnimation_shadowColor.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTAnimation_shadowColor.h"

@interface KTAnimation_shadowColor ()
@property (nonatomic , strong) UIImageView *wsView;
@end

@implementation KTAnimation_shadowColor


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initUI];
    
}


- (void)initUI {
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:imageName2];
    _wsView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _wsView.layer.shadowOffset = CGSizeMake(7, 7);
    _wsView.layer.shadowOpacity = 0.70;
    [self.view addSubview:_wsView];
    
    NSArray *titleArr = @[@"红",@"黄",@"绿",@"黑",@"紫"];
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
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
            anima.toValue =(id) [UIColor redColor].CGColor;
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"shadowColor"];
            
            
        }
            break;
        case 1:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
            anima.toValue =(id) [UIColor yellowColor].CGColor;
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"shadowColor"];
            
            
        }
            break;
        case 2:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
            anima.toValue =(id) [UIColor greenColor].CGColor;
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"shadowColor"];
            
            
        }
            break;
        case 3:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
            anima.toValue =(id) [UIColor blackColor].CGColor;
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"shadowColor"];
            
            
        }
            break;
        case 4:
        {
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"shadowColor"];
            anima.toValue =(id) [UIColor purpleColor].CGColor;
            anima.duration = 1.0f;
            //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
            anima.fillMode = kCAFillModeForwards;
            anima.removedOnCompletion = NO;
            [_wsView.layer addAnimation:anima forKey:@"shadowColor"];
            
            
        }
            break;
        default:
            break;
    }
    
}



@end
