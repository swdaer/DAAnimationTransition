//
//  BTTransitionAnimator.m
//  TestDeom
//
//  Created by 陈达尔 on 16/8/24.
//  Copyright © 2016年 dahl.chen. All rights reserved.
//

#import "BTTransitionAnimator.h"

@interface BTTransitionAnimator ()<UIViewControllerAnimatedTransitioning>

@property (weak, nonatomic) id transitionContext;

@end

@implementation BTTransitionAnimator
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

/**
 *  转场动画内容
 *
 *  @param transitionContext
 */
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = fromVC.view.frame;
    [containerView addSubview:toVC.view];
    
    UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetWidth(fromVC.view.bounds), 0, 0, 0)];
    CGPoint extremePoint = CGPointMake(CGRectGetWidth(fromVC.view.bounds),CGRectGetHeight(toVC.view.bounds));
    
    float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y); 
    UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(CGRectGetWidth(fromVC.view.bounds), 0, 0, 0), -radius, -radius)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = finalPath.CGPath;
    toVC.view.layer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
    animation.toValue = (__bridge id _Nullable)(finalPath.CGPath);
    animation.duration = [self transitionDuration:transitionContext];
    animation.delegate = self;
    [maskLayer addAnimation:animation forKey:@"path"];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
}

@end
