//
//  BloodPressureAnalysisCurveViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodPressureAnalysisCurveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBloodPressureAnalysis()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testBloodPressureAnalysis(){
        let unitsSold = [[141.0, 134.0, 126.0, 133.0, 122.0, 136.0, 134.0], [81.0, 94.0, 116.0, 83.0, 112.0, 126.0, 84.0], [72.0, 64.0, 86.0, 73.0, 92.0, 76, 60]]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        var chartView = DrawCharts.bloodPressureAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
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
