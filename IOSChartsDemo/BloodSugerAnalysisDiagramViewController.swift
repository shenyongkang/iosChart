//
//  BloodSugerAnalysis1ViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/21.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodSugerAnalysisDiagramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testbloodSugerAnalysisChart1()
        testbloodSugerAnalysisChart2()
        testbloodSugerAnalysisChart3()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testbloodSugerAnalysisChart1(){
        let unitsSold = [18.0, 15]
        var chartView = DrawCharts.bloodSugerAnalysisChart1(CGRect(x: 0, y: 164, width: view.frame.width * 2/5 , height: 120), data: unitsSold)
        view.addSubview(chartView)
        
    }
 
    
    func testbloodSugerAnalysisChart2(){
        let unitsSold = [18.0, 15, 24, 20]
        var chartView = DrawCharts.bloodSugerAnalysisChart2(CGRect(x: view.frame.width * 2/5, y: 164, width: view.frame.width * 2/5 , height: 120), data: unitsSold)
        view.addSubview(chartView)
        
    }
    func testbloodSugerAnalysisChart3(){
        let unitsSold = [50.0, 130, 90, 120.0, 140, 88, 123.0, 150, 80]
        var chartView = DrawCharts.bloodSugerAnalysisChart3(CGRect(x: 0, y: 364, width: view.frame.width * 2/5 , height: 100), normalCount: 40, highCount: 20, lowCount: 5)
        
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
