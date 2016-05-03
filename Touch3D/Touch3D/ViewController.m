//
//  ViewController.m
//  Touch3D
//
//  Created by HELLO  on 16/5/3.
//  Copyright © 2016年 BeiJingYinChuang. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * list;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _list = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++) {
        
        [_list addObject:@(i)];
        
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:cellIdentifier] ;
    
    if(cell==nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_list[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    detailVC.number =_list[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location


{
    NSIndexPath * indexPath = [_tableView indexPathForRowAtPoint:location];
    UITableViewCell * celll = [_tableView cellForRowAtIndexPath:indexPath];
    DetailViewController * detail = [[DetailViewController alloc]init];
    detail.number =_list[indexPath.row];
    previewingContext.sourceRect = celll.frame;
    
    return detail;
    
}
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{

    [self showViewController:viewControllerToCommit sender:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
