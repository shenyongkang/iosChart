//
//  BodyWeightViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyWeightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBodyWeightChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testBodyWeightChart() {
        let unitsSold = [[71.0, 74.0, 66.0, 83.0, 42.0, 76.0, 74.0], [22.0, 24.0, 23.0, 23.0, 22.0, 24.0, 22.60]]
        let dataLabels = ["6" , "7","8", "9",  "10", "11", "12"]
    
        let contentRect = CGRect(x: 0, y: 364, width: view.frame.width , height: 200)
    
        let chartView = DrawCharts.bodyWeight(contentRect, data: unitsSold, labels: dataLabels)
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
