//
//  BodyHeightAnalysisViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyHeightAnalysisViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBodyHeightAnalysisChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testBodyHeightAnalysisChart() {
        let unitsSold = [[41.0, 44.0, 46.0, 53.0, 62.0, 66.0, 74.0], [31.0, 34.0, 36.0, 43.0, 52.0, 55.0, 56.0]]
        let dataLabels = ["1月" , "2月", "三月", "四月",  "五月", "六月", "七月"]
        
        var contentRect = CGRect(x: 0, y: 64, width: view.frame.width , height: 350)
        
        var chartView = DrawCharts.bodyHeightAnalysis(contentRect, data: unitsSold, labels: dataLabels)
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
