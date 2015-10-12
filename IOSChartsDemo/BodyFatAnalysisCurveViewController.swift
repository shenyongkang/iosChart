//
//  BodyFatAnalysisCurveViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/24.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BodyFatAnalysisCurveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBodyFatAnalysis()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testBodyFatAnalysis(){
        let unitsSold = [[61.0, 74.0, 66.0, 63.0, 52.0, 60.0, 64.0], [31.0, 24.0, 26.0, 33.0, 32.0, 26.0, 24.0], [22.0, 24.0, 16.0, 17.0, 19.0, 17, 20]]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        let chartView = DrawCharts.bodyFatAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
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
