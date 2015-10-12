//
//  SleepAnalysisOneWeekViewController.swift
//  IOSChartsDemo
//
//  Created by ios2 on 15/9/11.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class SleepAnalysisOneWeekViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 120/255, green: 195/255, blue: 200/255, alpha: 1)
        testSleepAnalysisOneWeek()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testSleepAnalysisOneWeek(){
        let unitsSold = [[10.0, 20, 30], [11.0, 22], [12.0, 21, 23], [17.0, 22,11], [11.0, 23, 11] ]
        let myLabels = ["周一", "周二","周三", "周四", "周五"]
        let chartView = DrawCharts.sleepAnalysisOneWeek(CGRect(x: 0, y: 164, width: view.frame.width , height: 300), data: unitsSold, labels: myLabels)
        view.addSubview(chartView)
        
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
