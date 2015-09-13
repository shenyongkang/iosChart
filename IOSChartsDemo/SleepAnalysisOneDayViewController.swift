//
//  SleepAnalysisOneDayViewController.swift
//  IOSChartsDemo
//
//  Created by ios2 on 15/9/11.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class SleepAnalysisOneDayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testSleepAnalysisOneDay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testSleepAnalysisOneDay(){
        var duration = [100.0,10.0, 20, 50, 100, 50]
        var type = ["N", "A", "D", "S", "D", "A"]
        var rect = CGRect(x: 0, y: 164, width: view.frame.width , height: 300)
        var myView = DrawCharts.sleepAnalysisOneDay(rect, sleepDuration: duration, sleepType: type)
        view.addSubview(myView)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
