//
//  BloodPressureMonitorViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodPressureMonitorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBloodPressureChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testBloodPressureChart() {
        let unitsSold = [[141.0, 134.0, 126.0, 133.0, 122.0, 136.0, 134.0], [111.0, 94.0, 116.0, 103.0, 112.0, 126.0, 114.0], [72.0, 64.0, 86.0, 73.0, 92.0, 76, 60]]
        let dataLabels = ["周日" , "周一","周二", "周三",  "周四", "周五", "周日"]
        
        
        var chartView = DrawCharts.bloodPressureMonitor(CGRect(x: 0, y: 364, width: view.frame.width , height: 250), data: unitsSold, labels: dataLabels)

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
