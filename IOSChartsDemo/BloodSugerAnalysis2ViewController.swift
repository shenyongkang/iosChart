//
//  BloodSugerAnalysis2ViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/21.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class BloodSugerAnalysis2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testBloodSugerAnalysis()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func testBloodSugerAnalysis(){
        
        let unitsSold = [4.0, 5.0, 6.0, 5.3, 7.0, 6.0, 4.0]
        let dataLabels = ["22" , "23","24", "25",  "26", "27", "28"]
        var chartView = DrawCharts.bloodSugerAnalysis(CGRect(x: 0, y: 164, width: view.frame.width , height: 400), data: unitsSold, labels: dataLabels)
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
