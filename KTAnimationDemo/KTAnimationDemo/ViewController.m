//
//  ViewController.m
//  KTAnimationDemo
//
//  Created by Kevin Tan on 2020/7/1.
//  Copyright © 2020 Kevin Tan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy)NSArray * dataArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Animation动画";
     
    self.dataArr = @[
        @[
            @{@"titleName":@"位移(position)",
              @"className":@"KTAnimation_position",},
            @{@"titleName":@"透明度(opacity)",
              @"className":@"KTAnimation_opacity",},
            @{@"titleName":@"缩放(scale)",
              @"className":@"KTAnimation_Scale",},
            @{@"titleName":@"旋转(rotation)",
              @"className":@"KTAnimation_Rotation",},
            @{@"titleName":@"背景颜色变换(backgroundColor)",
              @"className":@"KTAnimation_BGColor",},
            @{@"titleName":@"圆角(cornerRadius)",
              @"className":@"KTAnimation_cornerRadius",},
            @{@"titleName":@"切换图片",
              @"className":@"KTAnimation_ChangeImg",},
            @{@"titleName":@"边框宽(borderWidth)",
              @"className":@"KTAnimation_BorderWidth",},
            @{@"titleName":@"阴影颜色(shadowColor)",
              @"className":@"KTAnimation_shadowColor",},
        ],
        @[
            @{@"titleName":@"组动画",
            @"className":@"KTAnimation_Group",},
        ],
        @[
            @{@"titleName":@"转场动画",
            @"className":@"KTAnimationTransition",},
        ]
    ];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [(NSArray *)[self.dataArr objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identy = @"tableviewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
    }
    NSDictionary * dic = (NSDictionary *)[[self.dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"titleName"];
    return cell;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *array = @[@"基础动画",@"组动画",@"转场动画"];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, kScreenWidth-40, 25)];
    label.textColor = [UIColor orangeColor];
    label.text = [array objectAtIndex:section];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * dic = (NSDictionary *)[[self.dataArr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString * className = [dic objectForKey:@"className"];
    UIViewController * vcClass = (UIViewController*)NSClassFromString(className);
    //调用pushFrontViewController进行页面切换
    [self.navigationController pushViewController:vcClass animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //将cell的分隔线延长到整个屏幕宽   避免左边出现一段空隙
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

@end
