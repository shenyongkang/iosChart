//
//  BodyHeightViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyHeightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBodyHeightChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testBodyHeightChart() {
        let unitsSold = [41.0, 44.0, 46.0, 53.0, 62.0, 66.0, 74.0]
        let dataLabels = ["1月" , "2月", "三月", "四月",  "五月", "六月", "七月"]
        
        let contentRect = CGRect(x: 0, y: 364, width: view.frame.width , height: 200)
        
        let chartView = DrawCharts.bodyHeight(contentRect, data: unitsSold, labels: dataLabels)
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
