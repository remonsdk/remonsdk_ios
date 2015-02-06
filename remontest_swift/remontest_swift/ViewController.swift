//
//  ViewController.swift
//  remontest_swift
//
//  Created by Rabbit on 2015. 1. 21..
//  Copyright (c) 2015년 dnasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var listArray = NSMutableArray()
    let tableData = ["Inline", "Square", "Rectangle", "Floating", "Interstitial", "Agreement"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for index in 1...5 {
            listArray.addObject(index)
        }
        
        self.navigationItem.title = "Remon SDK Sample"
        
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"Cell")

        
        println("id : \(NSBundle.mainBundle().infoDictionary)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = "\(self.tableData[indexPath.row])"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        //openModal(indexPath.row);
        var vc:UIViewController
        
        switch indexPath.row {
        case 0:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("InlineViewController") as UIViewController
        case 1:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("SquareViewController") as UIViewController
        case 2:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("RectangleViewController") as UIViewController
        case 3:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("FloatingViewController") as UIViewController
        case 4:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("InterstitialViewController") as UIViewController
        case 5:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("AgreementViewController") as UIViewController
        default:
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("InlineViewController") as UIViewController
        }
        
        //var vc:UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InlineViewController") as UIViewController
        vc.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        //self.navigationController?.pushViewController(vc, animated: true)
        //var nc: UINavigationController = self.navigationController!
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openModal(inde: Int) {
        
        presentViewController(InlineViewController(), animated: false, completion: nil);
    }

}