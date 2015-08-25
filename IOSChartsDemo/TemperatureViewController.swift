//
//  TemperatureViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testTemperatureChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func testTemperatureChart() {
        let unitsSold = [37.0, 37.5, 36.8, 37.2, 36.20, 36.0, 37.4]
        let xValues = [1,3,5,7,9,21,23]
        
        var contentRect = CGRect(x: 0, y: 364, width: view.frame.width , height: 200)
        
        var chartView = DrawCharts.temperature(contentRect, data: unitsSold, xValues: xValues)
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
