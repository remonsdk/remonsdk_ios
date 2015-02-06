//
//  InterstitialViewController.swift
//  remontest_swift
//
//  Created by Rabbit on 2015. 1. 21..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

import UIKit

class InterstitialViewController: UIViewController, RemonDelegate {

    var core: remon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Interstitial"
        
        initRemon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        //광고 제거 
        if(core != nil) {
            core.stopAd()
            core.removeAd()
            core = nil
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func initRemon() {
        
        if(core != nil) {
            core.stopAd()
            core.removeAd()
            core = nil
        }
        
        /*
        cID 및 각종 파라메터 추가
        */
        core = remon(view: nil, delegate: self)             //광고 sdk 초기화 및 광고 뷰 설정
        core.clientID = "MTQyOTE5Mjg5MjcyOTE0"              //발급 받은 cId로 대치 (Mandatory)
        core.logMode = true                                 //로그 출력 여부 설정(스토어 업로드시 false로 설정)
        core.testMode = true                                //테스트 모드 여부 설정 (스토어 업로드시 false로 설정)
        core.defaultBGColor = UIColor.purpleColor()         //BG color 설정 (optional, default : whiteColor 사용자가 설정한 값이 없을 경우 광고에서 설정된 값이 노출된다.)
        core.autoCloseTime = 10                             //자동 닫힘 시간 설정 (0 초과 10 이하, default : 3)
        core.isAutoClose = true                             //자동 닫힘 사용 여부 (default : false)
        core.isAgreeTerm = true                             //약관 동의 여부 설정 (optinal, default : false)
        core.ageCode = 2                                    //사용 나이대 설정 (optional, 광고 타켓딩을 위해 사용)
        core.gender = 1                                     //성별 설정 (optional, 광고 타겟팅을 위해 사용)
        core.loadAd()                                       //서버로 광고 호출

    }
    
    
    /**
    * 광고가 시작 요청  (USER -> SDK)
    */
    func onRemonStartAd(core: remon!) {
        
        println("onRemonStartAd : \(core)");
    }
    
    /**
    * 서버로 광고 요청  (SDK -> SERVER)
    */
    func onRemonRequestedAd(core: remon!) {
        
        println("onRemonRequestedAd : \(core)");
    }
    
    /**
    * 서버로 부터의 응답 (SDK <- SERVER)
    */
    func onRemonReceviedAd(core: remon!) {
        
        println("onRemonReceviedAd : \(core)");
    }
    
    /**
    * 광고가 보여지기 직전 호출
    */
    func onRemonBeforeShowAd(core: remon!) {
        
        println("onRemonBeforeShowAd : \(core)");
    }
    
    /**
    * 광고를 보여준 이후  호출
    */
    func onRemonAfterShowAd(core: remon!) {
        
        println("onRemonAfterShowAd : \(core)");
    }
    
    /**
    * 광고 클릭시 호출
    */
    func onRemonClickedAd(core: remon!) {
        
        println("onRemonClickedAd : \(core)");
    }
    
    /**
    * SDK 오류시 호출
    * @param RemonAdError 참조
    */
    func onRemonAdError(core: remon!, code: RemonAdError) {
        
        println("onRemonAdError : \(core), code : \(code.value), error String is : \(core.errorCodeToString(code))");
    }
    
    /**
    * 광고 종료시 호출
    */
    func onRemonClosed(core: remon!) {
        
        println("onRemonClosed : \(core)");
    }
    
    /**
    * 전면 광고 종료시 호출
    */
    func onInterstialAdClosed(core: remon!) {
        println("onInterstialAdClosed : \(core)")
    }
}
