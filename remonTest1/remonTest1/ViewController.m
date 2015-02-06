//
//  ViewController.m
//  remonTest1
//
//  Created by dnasoft on 2015. 1. 22..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Remon SDK Sample";
    
    NSMutableArray *listArray = [[NSMutableArray alloc] initWithObjects:@"Inline", @"Square", @"Rectangle", @"Floating", @"Interstitial", @"Agreement", nil];
    
    [self setListArray:listArray];
    listArray = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [_listArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc;
    
    switch (indexPath.row) {
        case 0:
            vc = [self getViewController:@"InlineViewController"];
            break;
        case 1:
            vc = [self getViewController:@"SquareViewController"];
            break;
        case 2:
            vc = [self getViewController:@"RectangleViewController"];
            break;
        case 3:
            vc = [self getViewController:@"FloatingViewController"];
            break;
        case 4:
            vc = [self getViewController:@"InterstitialViewController"];
            break;
        case 5:
            vc = [self getViewController:@"AgreementViewController"];
            break;
        default:
            break;
    }
    
    if(vc != nil) {
        [vc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIViewController *) getViewController:(NSString *)idenifier {
    
    UIViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:idenifier];
    
    return vc;
}

@end
