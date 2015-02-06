//
//  remon.h
//  remon
//
//  Created by Rabbit on 2013. 11. 1..
//  Copyright (c) 2013년 DNA Soft. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "RemonURLConnection.h"

typedef enum{
    kINLINE,
    kRECTANGLE,
    kSQUARE,
    kINTERSTITIAL,
    kPOPUP,
    kFLOATING
}RemonADType;

typedef enum{
    kRemonSDK       = 0,
    kRemonService1  = 1,
    kRemonService2  = 2,
    kRemonService3  = 3,
    kRemonService4  = 4
}RemonAccountType;

typedef enum{
    kNO_AD,
    kINVAILD_CLIENT_ID,
    kUNDEFINE_PKGNAME,
    kNETWORK_ERROR,
    kCONNECTION_ERROR,
    kRECEVIDED_AD_ERROR,
    kLOAD_AD_ERROR,
    kSHOW_AD_ERROR,
    kNOT_HAVE_PARENTVIEWCONTROLLER
}RemonAdError;

typedef enum  {
    /**
     * 광고 노출 준비
     */
    kAdReady,
    /**
     * 광고 오류
     */
    kAdError,
    /**
     * 광고 노출
     */
    kAdViewing,
    /**
     * 광고 일시 정지
     */
    kADPause,
    /**
     * 광고 일시 정지 해제
     */
    kADResume,
    /**
     * 광고 정지
     */
    kADStop,
    /**
     * 광고 제거
     */
    kADDetroy
}ADState;

@class remon;
@protocol RemonDelegate <NSObject>

@optional

/**
 * 광고가 시작 요청  (USER -> SDK)
 */
- (void) onRemonStartAd:(remon *)core;
/**
 * 서버로 광고 요청  (SDK -> SERVER)
 */
- (void) onRemonRequestedAd:(remon *)core;

/**
 * 서버로 부터의 응답 (SDK <- SERVER)
 */
- (void) onRemonReceviedAd:(remon *)core;

/**
 * 광고가 보여지기 직전 호출
 */
- (void) onRemonBeforeShowAd:(remon *)core;

/**
 * 광고를 보여준 이후  호출
 */
- (void) onRemonAfterShowAd:(remon *)core;

/**
 * 광고 확장시 호출 (Floating에서만 해당)
 */
- (void) onRemonExpandedAd:(remon *)core;

/**
 * 광고 클릭시 호출
 */
- (void) onRemonClickedAd:(remon *)core;

/**
 * SDK 오류시 호출
 * @param RemonAdError 참조
 */
- (void)onRemonAdError:(remon *)core code:(RemonAdError)code;

/**
 * 광고 종료시 호출
 */
- (void)onRemonClosed:(remon *)core;

/**
 * 전면 광고 종료시 호출
 */
- (void)onInterstialAdClosed:(remon *)core;

@end

/**
 * 개인 정보 취급 방침 Delegate
 */
@protocol RemonUserAgreementDelegate <NSObject>

/**
 * 개인 정보 취급 방침 동의/동의안함 선택시 호출
 */
- (void) onUserAgreement:(BOOL)agree;

@end

@protocol RemonTimerDelegate <NSObject>

@optional
- (void) onTimer;

@end


@interface remon : NSObject <RemonConnectionDelegate, RemonTimerDelegate, CLLocationManagerDelegate>

@property (nonatomic, assign)   int                 refreshInterval;
@property (nonatomic, strong)   NSString *          clientID;
@property (nonatomic, assign)   BOOL                logMode;
@property (nonatomic, assign)   BOOL                testMode;
@property (nonatomic, assign)   int                 ageCode;
@property (nonatomic, assign)   int                 gender;
@property (nonatomic, strong)   UIColor *           defaultBGColor;

@property (nonatomic, assign)   BOOL                useGioTargeting;                //지역정보 사용 여부 (default : NO)
@property (nonatomic, assign)   BOOL                isAgreeTerm;                    //개인정보 취급 방침 동의 여부 (default : NO)

/* Popup 광고 설정 */
@property (nonatomic, assign)   BOOL                isFloating;
@property (nonatomic, assign)   BOOL                isPopup;                        //팝업 광고 인지 여부 (default : NO, square형 광고에만 해당)
@property (nonatomic, assign)   CGPoint             adPosistion;

@property (nonatomic, assign)   int                 autoCloseTime;                  //전면 및 팝업 자돋 닫힘 시간 (default : 10)
@property (nonatomic, assign)   BOOL                isAutoClose;                    //전면 및 팝업 자동 닫힘 사용 여부 (defaule : NO)

@property (nonatomic, assign)   int                 landingTime;                    //플로팅의 경우 확장 이후 자동 Landing 시간(default : 3, min : 1, max : 5)

@property (nonatomic, assign)   BOOL                interstitialTest;               //서버 완성되기전 전면 테스트 용도
@property (nonatomic, assign)   CGPoint             offset;

@property (nonatomic, unsafe_unretained)            id<RemonDelegate>   adDelegate;
@property (nonatomic, unsafe_unretained)            UIView *            adView;

//@property (nonatomic, unsafe_unretained)     UIViewController *  parentViewConteroller;

- (id) initWithView:(UIView *)view delegate:(id<RemonDelegate>) delegate;
- (void) loadAd;
- (void) stopAd;
- (void) removeAd;

- (void) onInterstialAdClosed;
- (NSString *) errorCodeToString:(RemonAdError)errorCode;

- (NSString *) RemonSDKVerion;
- (NSString *) RemonSDKBuildDate;

+ (void) RemonUserAgreement:(UIViewController *)parentViewConteroller delegate:(id<RemonUserAgreementDelegate>)delegate; //개인 정보 취금 방침 출력 (Modal)

@end

