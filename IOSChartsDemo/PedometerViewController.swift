//
//  PedometerViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/10/12.
//  Copyright © 2015年 kankan. All rights reserved.
//

import UIKit

class PedometerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let values = [100, 353, 0, 0, 33, 0, 555, 100, 353, 0, 0, 33, 0, 555, 1234, 2587 ]
        let dataLabels = ["01" , "02", "03", "04",  "05", "06", "07", "01" , "02", "03", "04",  "05", "06", "07", "10", "22"]
        view.backgroundColor = UIColor(red: 120/255, green: 95/255, blue: 200/255, alpha: 1)
        
        
        let chartView = DrawCharts.pedometerMonitor(CGRect(x: 0, y: 364, width: view.frame.width , height: 250), data: values, labels: dataLabels)
        
        view.addSubview(chartView)    }

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
