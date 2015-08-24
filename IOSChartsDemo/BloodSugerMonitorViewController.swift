//
//  BloodSugerMonitorViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/21.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodSugerMonitorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBloodSugerMonitorChart1()
        testBloodSugerMonitorChart2()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testBloodSugerMonitorChart1(){

        var chartView = DrawCharts.bloodSugerMonitorChart1(CGRect(x: 0, y: 64, width: view.frame.width * 4/5 , height: 150), normalCount: 3, highCount: 2, lowCount: 5)
        
        view.addSubview(chartView)
        
    }
    func testBloodSugerMonitorChart2() {
        let unitsSold = [5.0, 3.5, 5.9, 12.0, 6.40, 8.8, 4.0]
        let dataLabels = ["周日" , "周一","周二", "周三",  "周四", "周五", "周日"]
        
        
        var chartView = DrawCharts.bloodSugerMonitorChart2(CGRect(x: 0, y: 364, width: view.frame.width , height: 200), data: unitsSold, labels: dataLabels)
        
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
