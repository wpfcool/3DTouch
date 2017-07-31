//
//  DetailViewController.m
//  Touch3D
//
//  Created by HELLO  on 16/5/3.
//  Copyright © 2016年 BeiJingYinChuang. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"%@",_number];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
     label.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint * constraint = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
        NSLayoutConstraint * constrainty = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [self.view addConstraint:constraint];
    [self.view addConstraint:constrainty];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"action1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action1 click");
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"action2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action2 click");
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"action3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"action3 click");
    }];
    
    
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"group1" style:UIPreviewActionStyleDefault actions:@[action1,action2]];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"group2" style:UIPreviewActionStyleDestructive actions:@[action1,action3]];
    UIPreviewActionGroup *group3 = [UIPreviewActionGroup actionGroupWithTitle:@"group3" style:UIPreviewActionStyleSelected actions:@[action2,action3]];
    NSArray *items = @[action1,group1,action2,group2,action3,group3];
    return items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
