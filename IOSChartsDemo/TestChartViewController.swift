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
        testBloodPressureChart()
//        view.addSubview(DrawCharts.testCharts(CGRect(x: 0, y: 364, width: view.frame.width , height: 200)))

        // Do any additional setup after loading the view.
    }
    
    
    func testBloodPressureChart() {
        let unitsSold = [[141.0, 134.0, 126.0, 133.0, 122.0, 136.0, 134.0], [111.0, 94.0, 116.0, 103.0, 112.0, 126.0, 114.0], [72.0, 64.0, 86.0, 73.0, 92.0, 76.0, 74.0]]
        
        
        var image = UIImage(named: "bg_blood_pressure.png")
        
        var backgroundImage = UIImageView(image: image)
        backgroundImage.contentMode = UIViewContentMode.ScaleToFill
        
        backgroundImage.alpha = 1
        backgroundImage.frame = CGRect(x: 30, y: 364, width: view.frame.width - 30 , height: 152)
        view.addSubview(backgroundImage)
        
        var chartView = DrawCharts.bloodPressureMonitor(CGRect(x: 0, y: 364, width: view.frame.width , height: 200), data: unitsSold)
        view.addSubview(chartView)
        
        
    }
    
    func testHistoryChart()
    {
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [21.0, 14.0, 16.0, 13.0, 12.0, 16.0, 14.0, 18.0, 12.0, 14.0, 15.0, 14.0]
        var chartView = DrawchartsGuide.historyLine(CGRect(x: 0, y: 64, width: view.frame.width , height: 400), data: unitsSold, labels: months)
        view.addSubview(chartView)
    }
    
    func testHomePageChart(){
        let unitsSold = [1.0, 13, 118, 113, 120, 1121, 1629, 2150, 2280, 3120, 3150, 3170, 3190, 4201, 4203, 4528, 4640, 4751, 5263, 5271, 5290, 5300, 5408, 5420, 5420]
        var chartView = DrawCharts.homePageView1(CGRect(x: 0, y: 64, width: view.frame.width , height: 200), data: unitsSold)
        
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
