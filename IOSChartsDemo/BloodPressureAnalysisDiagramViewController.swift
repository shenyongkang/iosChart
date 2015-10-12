//
//  BloodPressureAnalysisDiagramViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodPressureAnalysisDiagramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBloodPressureAnalysisChart1()
        testBloodPressureAnalysisChart2()
        testBloodPressureAnalysisChart3()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testBloodPressureAnalysisChart3(){
        _ = [50.0, 130, 90, 120.0, 140, 88, 123.0, 150, 80]
        let chartView = DrawCharts.bloodPressureAnalysisChart3(CGRect(x: 0, y: 264, width: view.frame.width * 2/5 , height: 100), normalCount: 3, highCount: 5, lowCount: 2)
        
        view.addSubview(chartView)
        
    }
    
    func testBloodPressureAnalysisChart2(){
        let unitsSold = [[150.0, 130, 90], [120.0, 140, 88], [123.0, 150, 80]]
        let chartView = DrawCharts.bloodPressureAnalysisChart2(CGRect(x: view.frame.width * 2/5 , y: 164, width: view.frame.width * 3/5 , height: 100), data: unitsSold)
        view.addSubview(chartView)
        
    }
    
    func testBloodPressureAnalysisChart1(){
        let unitsSold = [[150.0, 130, 90], [120.0, 140, 88]]
        let chartView = DrawCharts.bloodPressureAnalysisChart1(CGRect(x: 0, y: 164, width: view.frame.width * 2/5 , height: 100), data: unitsSold)
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
