//
//  BTFristViewController.m
//  TestDeom
//
//  Created by 陈达尔 on 16/8/24.
//  Copyright © 2016年 dahl.chen. All rights reserved.
//

#import "BTFristViewController.h"
#import "BTSecondViewController.h"
#import "BTNavigationDelegate.h"

@interface BTFristViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) BTNavigationDelegate * navigationDelegate;
@end

@implementation BTFristViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _navigationDelegate = [BTNavigationDelegate new];
    self.navigationController.delegate = (id)_navigationDelegate;
    
    UIBarButtonItem * next = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(clickPushAction:)];
    self.navigationItem.rightBarButtonItem = next;
}

- (void)clickPushAction:(id)sender
{
    BTSecondViewController * controller = [BTSecondViewController new];
    [self.navigationController pushViewController:controller animated:YES];
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
