//
//  HomePageViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/25.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testHomePageChart()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func testHomePageChart(){
        let unitsSold = [1.0, 13, 118, 113, 120, 1121, 1629, 2150, 2280, 3120, 3150, 3170, 3190, 4201, 4203, 4528, 4640, 4751, 5263, 5271, 5290, 5300, 5408, 5420, 5420]
        var chartView = DrawCharts.homePageView1(CGRect(x: 0, y: 64, width: view.frame.width , height: 200), data: unitsSold)
        
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
