//
//  ViewController.m
//  storyboard 中约束的优先级
//
//  Created by 时彬强 on 15/12/22.
//  Copyright © 2015年 QQLS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /*
     * 由于刚开始绿色的 view 和蓝色的 view 之间约束的优先级为1000，
     * 绿色的 view 和红色的 view 之间的约束的优先级为750，
     * 因此先执行优先级较高的约束
     */
    // 将中间的蓝色视图移除
    [self.blueView removeFromSuperview];
    // 利用2s的时间去更新约束，在修改了约束之后，只要执行下面代码，就能做动画效果
    [UIView animateWithDuration:2.0f animations:^{
        
        // 强制更新约束（让self.view以及它的所有子控件都强制更新）
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
