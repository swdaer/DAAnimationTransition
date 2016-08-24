//
//  BTNavigationDelegate.m
//  TestDeom
//
//  Created by 陈达尔 on 16/8/24.
//  Copyright © 2016年 dahl.chen. All rights reserved.
//

#import "BTNavigationDelegate.h"
#import "BTTransitionAnimator.h"

@interface BTNavigationDelegate ()<UINavigationControllerDelegate>

@end

@implementation BTNavigationDelegate
- (nullable id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return (id)[BTTransitionAnimator new];
}

@end
