//
//  PushTransition.m
//  pushTransitionDemo
//
//  Created by fish on 2016/11/1.
//  Copyright © 2016年 foolish. All rights reserved.
//

#import "PushTransition.h"
#import "ViewController.h"
#import "TempViewController.h"

@interface PushTransition ()

@end

@implementation PushTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ViewController *fromViewController = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TempViewController *toViewController = (TempViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *snapshot = [fromViewController.iconImgView snapshotViewAfterScreenUpdates:NO];
    
    snapshot.frame = [fromViewController.view convertRect:fromViewController.iconImgView.frame fromView:fromViewController.bottomView];
    fromViewController.iconImgView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:snapshot];
    
    [UIView animateWithDuration:duration delay:0.f usingSpringWithDamping:0.7f initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        snapshot.frame = frame;
        toViewController.view.alpha = 1.f;
        
    } completion:^(BOOL finished) {
        toViewController.imageView.hidden = NO;
        fromViewController.iconImgView.hidden = NO;
        [snapshot removeFromSuperview];
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}
@end
