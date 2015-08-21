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
        testBloodSugerAnalysisChart1()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testBloodSugerAnalysisChart1(){
        let unitsSold = [50.0, 130, 90, 120.0, 140, 88, 123.0, 150, 80]
        var chartView = DrawCharts.bloodSugerAnalysisChart1(CGRect(x: 0, y: 64, width: view.frame.width * 4/5 , height: 150), normalCount: 3, highCount: 2, lowCount: 5)
        
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
