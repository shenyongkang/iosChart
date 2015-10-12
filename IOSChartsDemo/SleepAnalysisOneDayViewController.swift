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
    
        view.backgroundColor = UIColor(red: 120/255, green: 195/255, blue: 200/255, alpha: 1)
        testSleepAnalysisOneDay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testSleepAnalysisOneDay(){
        let duration = [100.0,140.0, 200, 500, 100, 400]
        let type = ["N", "A", "D", "S", "D", "A"]
        let rect = CGRect(x: 0, y: 164, width: view.frame.width , height: 300)
        let myView = DrawCharts.sleepAnalysisOneDay(rect, sleepDuration: duration, sleepType: type)
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
