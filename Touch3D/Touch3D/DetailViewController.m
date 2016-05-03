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


- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction * shareAction = [UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    
    return @[shareAction];

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
