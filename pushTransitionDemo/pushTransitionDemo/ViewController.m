//
//  ViewController.m
//  pushTransitionDemo
//
//  Created by fish on 2016/11/1.
//  Copyright © 2016年 foolish. All rights reserved.
//

#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)

#import "ViewController.h"
#import "TempViewController.h"
#import "PushTransition.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

static CGFloat bottomHeight = 64;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, ScreenHeight - bottomHeight, ScreenWidth, bottomHeight);
    bottomView.backgroundColor = [UIColor blackColor];
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    
    UIImageView *iconImgView = [[UIImageView alloc] init];
    iconImgView.frame = CGRectMake(10, 10, 44, 44);
    iconImgView.layer.cornerRadius = 22;
    iconImgView.layer.masksToBounds = YES;
    iconImgView.backgroundColor = [UIColor redColor];
    iconImgView.userInteractionEnabled = YES;
    self.iconImgView = iconImgView;
    [bottomView addSubview:iconImgView];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickIconImgView:)];
    [iconImgView addGestureRecognizer:tapGes];
}

- (void)didClickIconImgView:(UITapGestureRecognizer *)sender {
    [self.navigationController pushViewController:[[TempViewController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[PushTransition alloc] init];
    }
    return nil;
}

@end
