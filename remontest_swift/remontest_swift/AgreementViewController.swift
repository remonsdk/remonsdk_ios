//
//  AgreementViewController.swift
//  remontest_swift
//
//  Created by Rabbit on 2015. 1. 21..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

import UIKit

class AgreementViewController: UIViewController, RemonUserAgreementDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Agreement"
        
        remon.RemonUserAgreement(self, delegate: self)  //약관 동의 호출 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    /**
    * 약관 동의
    */
    func onUserAgreement(agree: Bool) {
        
        println("onUserAgreement : \(agree)")
        
    }
}
