//
//  AgreementViewController.m
//  remonTest1
//
//  Created by dnasoft on 2015. 1. 22..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

#import "AgreementViewController.h"
#import "AppDelegate.h"

@interface AgreementViewController ()

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    self.navigationItem.title = @"Agreement";
    UIViewController *rootController = (UIViewController *)((AppDelegate *)([[UIApplication sharedApplication] delegate]).window.rootViewController);
    [remon RemonUserAgreement:rootController delegate:self];

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

/**
 * 약관 동의
 */
- (void)onUserAgreement:(BOOL)agree {
    
    NSLog(@"onRemonUserAggreement : %d", agree);
}

@end
