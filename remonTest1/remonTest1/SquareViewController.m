//
//  SquareViewController.m
//  remonTest1
//
//  Created by dnasoft on 2015. 1. 22..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

#import "SquareViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface SquareViewController () {
    
    UIView *adView;
}

@property (nonatomic, strong) remon *core;

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    self.navigationItem.title = @"Square";
    float statusBarHeight = 0.0f;
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        statusBarHeight = 20.0f;
    }
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];

    /*
     광고가 추가될 View 높이 설정
     */
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        adView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, screenBounds.size.height - 150.0f - statusBarHeight, screenBounds.size.width, 150.0f)];
    }
    else {
        adView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, screenBounds.size.width - 150.0f - statusBarHeight, screenBounds.size.height, 150.0f)];
    }
    
    [self.view addSubview:adView];
    
    [self initRemon];
    
}

- (void) dealloc {
    
    if(_core) {
        [_core stopAd];
        [_core removeAd];
        _core = nil;
    }
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


- (void) initRemon {
    
    if (_core) {
        [_core stopAd];
        _core = nil;
    }

    
    /*
     cID 및 각종 파라메터 추가
     */
    remon *core = [[remon alloc] initWithView:adView delegate:self];    //광고 sdk 초기화 및 광고 뷰 설정
    [core setLogMode:YES];                                              //로그 출력 여부 설정(스토어 업로드시 NO로 설정)
    [core setTestMode:YES];                                             //테스트 모드 여부 설정 (스토어 업로드시 NO로 설정)
    [core setIsAgreeTerm:YES];                                          //약관 동의 여부 설정 (optinal, default : NO)
    [core setClientID:@"MTQyODkzNTQxNDcyNzQx"];                         //발급 받은 cId로 대치 (Mandatory)
    [core setDefaultBGColor:[UIColor greenColor]];                      //BG color 설정 (optional, default : whiteColor 사용자가 설정한 값이 없을 경우 광고에서 설정된 값이 노출된다.)
    [core setRefreshInterval:30];                                       //광고 갱신 시간 설정 (30 ~ 300초)
    [core setAgeCode:2];                                                //사용 나이대 설정 (optional, 광고 타켓딩을 위해 사용)
    [core setGender:1];                                                 //성별 설정 (optional, 광고 타겟팅을 위해 사용)
    [core loadAd];                                                      //광고 호출
    
    _core = core; //광고를 전역 변수로 가지고 있지 않을 경우 해제될 수 있다.
}

#pragma mark -
#pragma mark Remon SDK Delegate

/**
 * 광고가 시작 요청  (USER -> SDK)
 */
- (void) onRemonStartAd:(remon *)core {
    NSLog(@"onRemonStartAd : %@", core);
}

/**
 * 서버로 광고 요청  (SDK -> SERVER)
 */
- (void) onRemonRequestedAd:(remon *)core {
    NSLog(@"onRemonRequestedAd : %@", core);
}

/**
 * 서버로 부터의 응답 (SDK <- SERVER)
 */
- (void) onRemonReceviedAd:(remon *)core {
    NSLog(@"onRemonReceviedAd : %@", core);
}

/**
 * 광고가 보여지기 직전 호출
 */
- (void) onRemonBeforeShowAd:(remon *)core {
    NSLog(@"onRemonBeforeShowAd : %@", core);
}

/**
 * 광고를 보여준 이후  호출
 */
- (void) onRemonAfterShowAd:(remon *)core {
    NSLog(@"onRemonAfterShowAd : %@", core);
}

/**
 * 광고 클릭시 호출
 */
- (void) onRemonClickedAd:(remon *)core {
    NSLog(@"onRemonClickedAd : %@", core);
}

/**
 * SDK 오류시 호출
 * @param RemonAdError 참조
 */
- (void)onRemonAdError:(remon *)core code:(RemonAdError)code {
    
    NSLog(@"onRemonAdError : %@, code : %d", core, code);
    NSLog(@"error String is : %@", [core errorCodeToString:code]);
}

/**
 * 광고 종료시 호출
 */
- (void)onRemonClosed:(remon *)core {
    
    NSLog(@"onRemonClosed : %@", core);
}

@end
