//
//  BodyFatMonitorViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/24.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyFatMonitorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBodyFatMonitorChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testBodyFatMonitorChart() {
        let unitsSold = [[71.0, 74.0, 66.0, 83.0, 42.0, 76.0, 74.0], [41.0, 44.0, 36.0, 43.0, 42.0, 46.0, 44.0], [22.0, 24.0, 23.0, 23.0, 22.0, 24.0, 26.60]]
        let dataLabels = ["周日" , "周一","周二", "周三",  "周四", "周五", "周日"]
        
        let contentRect = CGRect(x: 0, y: 364, width: view.frame.width , height: 200)
        
        let chartView = DrawCharts.bodyFatMonitor(contentRect, data: unitsSold, labels: dataLabels)
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
