//
//  TempViewController.m
//  pushTransitionDemo
//
//  Created by fish on 2016/11/1.
//  Copyright © 2016年 foolish. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

@end

@implementation TempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.navigationController.navigationBarHidden = YES;
    
    [self setupSubviews];
}

- (void)setupSubviews {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor redColor];
    imageView.frame = CGRectMake(0, 0, 300, 300);
    imageView.center = self.view.center;
    imageView.layer.cornerRadius = 150;
    imageView.layer.masksToBounds = YES;
    self.imageView = imageView;
    [self.view addSubview:imageView];
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

