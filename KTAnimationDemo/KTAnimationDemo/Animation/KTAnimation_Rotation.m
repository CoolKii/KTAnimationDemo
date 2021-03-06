//
//  KTAnimation_Rotation.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "KTAnimation_Rotation.h"

@interface KTAnimation_Rotation ()

@property (nonatomic, strong) UIImageView * wsView;
@property (nonatomic, strong) UIImageView * leidaImgV;
@property (nonatomic, strong) UIImageView * leidaBoImgV;
@property (nonatomic, strong) UIImageView * centerImgV;

@end

@implementation KTAnimation_Rotation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI {
    _leidaImgV = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, 120,160 ,160 )];
    _leidaImgV.image = [UIImage imageNamed:@"leidabgimg"];
    [self.view addSubview:_leidaImgV];
    _leidaBoImgV = [[UIImageView alloc] initWithFrame:CGRectMake(80, 80,80 ,80 )];
    _leidaBoImgV.image = [UIImage imageNamed:@"leidaBo"];
    _leidaBoImgV.layer.anchorPoint = CGPointZero;
    _leidaBoImgV.layer.position = CGPointMake(80, 80);
    [_leidaImgV addSubview:_leidaBoImgV];
    _centerImgV = [[UIImageView alloc] initWithFrame:CGRectMake((160 - 30) * 0.5, (160 - 30) * 0.5,30 ,30 )];
    _centerImgV.image = [UIImage imageNamed:@"image_gg"];
    _centerImgV.layer.cornerRadius = 15;
    _centerImgV.layer.masksToBounds = YES;
    [_leidaImgV addSubview:_centerImgV];
    
    _wsView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, kScreenHeight/2-80,160 ,160 )];
    _wsView.image = [UIImage imageNamed:imageName1];
    [self.view addSubview:_wsView];
    
    NSArray *titleArr = @[@"Z轴旋转",@"X轴旋转",@"Y轴旋转",@"抖动",@"Point",@"暂停",@"开始"];
    for (NSInteger i = 0 ; i < titleArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+(kScreenWidth-100)/4*(i%4)+20*(i%4), kScreenHeight - 150 +60*(i/4), (kScreenWidth-100)/titleArr.count, 40);
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
        case 0:{
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 1:{
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 2:{
            CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
            anima.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima.duration = 2.0f;
            [_wsView.layer addAnimation:anima forKey:@"rotateAnimation"];
        }
            break;
        case 3:{
            CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];//在这里@"transform.rotation"==@"transform.rotation.z"
            NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180*4];
            NSValue *value2 = [NSNumber numberWithFloat:M_PI/180*4];
            NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180*4];
            anima.values = @[value1,value2,value3];
            anima.repeatCount = 5;
            
            [_wsView.layer addAnimation:anima forKey:@"shakeAnimation"];
        }
            break;
        case 4:{//创建动画
            CABasicAnimation * anima1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            anima1.toValue = [NSNumber numberWithFloat:M_PI*2];
            anima1.duration = 2.0f;
            anima1.repeatCount = MAXFLOAT;
            [self.leidaBoImgV.layer addAnimation:anima1 forKey:@"rotateAnimation"];
        }
            break;
        case 5:{//暂停动画
            CFTimeInterval pausedTime = [self.leidaBoImgV.layer convertTime:CACurrentMediaTime() fromLayer:nil];
            self.leidaBoImgV.layer.timeOffset = pausedTime;
            self.leidaBoImgV.layer.speed = 0.0;
        }
            break;
        case 6:{//开始动画
            CFTimeInterval pausedTime = [self.leidaBoImgV.layer timeOffset];
            self.leidaBoImgV.layer.speed = 1.0;
            self.leidaBoImgV.layer.timeOffset = 0.0;
            self.leidaBoImgV.layer.beginTime = 0.0;
            CFTimeInterval timeSincePause = [self.leidaBoImgV.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
            self.leidaBoImgV.layer.beginTime = timeSincePause;
        }
            break;
        default:
            break;
    }
}



@end
