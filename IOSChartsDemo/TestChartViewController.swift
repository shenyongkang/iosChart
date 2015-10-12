//
//  TestChartViewController.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/13.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import UIKit

class TestChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testHomePageChart()        
//        testHistoryChart()
//        testBloodPressureChart()
//        testBloodPressureAnalysis()
//        testBloodSugerAnalysis()
//        testBodyFatAnalysis()
//        testBloodPressureAnalysisChart1()
//        testBloodPressureAnalysisChart2()
//        testBloodPressureAnalysisChart3()

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
    
    
    func testBodyFatAnalysis(){
        let unitsSold = [[61.0, 74.0, 66.0, 63.0, 52.0, 60.0, 64.0], [31.0, 24.0, 26.0, 33.0, 32.0, 26.0, 24.0], [22.0, 24.0, 16.0, 17.0, 19.0, 17, 20]]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        let chartView = DrawCharts.bodyFatAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
        view.addSubview(chartView)
        
        
    }
    
    func testBloodSugerAnalysis(){
        
        let unitsSold = [4.0, 5.0, 6.0, 5.3, 7.0, 6.0, 4.0]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        let chartView = DrawCharts.bloodSugerAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
        view.addSubview(chartView)
        
    }
    
    func testBloodPressureAnalysis(){
        let unitsSold = [[141.0, 134.0, 126.0, 133.0, 122.0, 136.0, 134.0], [81.0, 94.0, 116.0, 83.0, 112.0, 126.0, 84.0], [72.0, 64.0, 86.0, 73.0, 92.0, 76, 60]]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        let chartView = DrawCharts.bloodPressureAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
        view.addSubview(chartView)
        
        
    }
    
    
    func testBloodPressureChart() {
        let unitsSold = [[141.0, 134.0, 126.0, 133.0, 122.0, 136.0, 134.0], [111.0, 94.0, 116.0, 103.0, 112.0, 126.0, 114.0], [72.0, 64.0, 86.0, 73.0, 92.0, 76, 60]]
        let dataLabels = ["周日" , "周一","周二", "周三",  "周四", "周五", "周日"]
        
        
        let chartView = DrawCharts.bloodPressureMonitor(CGRect(x: 0, y: 364, width: view.frame.width , height: 250), data: unitsSold, labels: dataLabels)
//        var bgView = DrawCharts.bloodPressureMonitorBG(CGRect(x: 0, y: 364, width: view.frame.width , height: 250))
//        view.addSubview(bgView)
        view.addSubview(chartView)
        
        
    }
    
//    func testHistoryChart()
//    {
//        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//        let unitsSold = [21.0, 14.0, 16.0, 13.0, 12.0, 16.0, 14.0, 18.0, 12.0, 14.0, 15.0, 14.0]
//        var chartView = DrawchartsGuide.historyLine(CGRect(x: 0, y: 64, width: view.frame.width , height: 400), data: unitsSold, labels: months)
//        view.addSubview(chartView)
//    }
    
    func testHomePageChart(){
        let unitsSold = [1.0, 13, 118, 113, 120, 1121, 1629, 2150, 2280, 3120, 3150, 3170, 3190, 4201, 4203, 4528, 4640, 4751, 5263, 5271, 5290, 5300, 5408, 5420, 5420]
        let chartView = DrawCharts.homePageView1(CGRect(x: 0, y: 64, width: view.frame.width , height: 200), data: unitsSold)
        
        view.addSubview(chartView)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
