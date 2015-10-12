//
//  BodyFatAnalysis1ViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/24.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyFatAnalysisDiagramViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testbodyFatAnalysisChart1()
        testbodyFatAnalysisChart2()
        testbodyFatAnalysisChart3()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testbodyFatAnalysisChart3(){
        let chartView = DrawCharts.bodyFatAnalysisChart3(CGRect(x: 0, y: 264, width: view.frame.width * 2/5 , height: 100), normalCount: 3, highCount: 5, lowCount: 2)
        
        view.addSubview(chartView)
        
    }
    
    func testbodyFatAnalysisChart2(){
        let unitsSold = [[65.0, 30.1], [65.0, 30], [63.0, 30]]
        let chartView = DrawCharts.bodyFatAnalysisChart2(CGRect(x: view.frame.width * 2/5 , y: 164, width: view.frame.width * 3/5 , height: 100), data: unitsSold)
        view.addSubview(chartView)
        
    }
    
    func testbodyFatAnalysisChart1(){
        let unitsSold = [[60.0, 30], [64.3, 30]]
        let chartView = DrawCharts.bodyFatAnalysisChart1(CGRect(x: 0, y: 164, width: view.frame.width * 2/5 , height: 100), data: unitsSold)
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
