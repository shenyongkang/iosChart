//
//  ProblemViewController.swift
//  IOSChartsDemo
//
//  Created by 沈永康 on 15/8/18.
//  Copyright (c) 2015年 kankan. All rights reserved.
//

import UIKit
import Charts

class ProblemViewController: UIViewController {

    @IBOutlet weak var topView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(topView, dataPoints: months, values: unitsSold)
        
        let bottomView: LineChartView! = LineChartView(frame: CGRect(x: 0, y: 364, width: view.frame.width , height: self.topView.frame.size.height))
        
        topView.setNeedsDisplay()

        bottomView.autoScaleMinMaxEnabled = true
        setChart(bottomView, dataPoints: months, values: unitsSold)
//        bottomView.notifyDataSetChanged()
//        bottomView.setNeedsDisplay()
        //bottomView.autoresizingMask = UIViewAutoresizing.None
       // bottomView.autoresizesSubviews = true
        view.addSubview(bottomView)
        
        print(topView, terminator: "")
        print("\n", terminator: "")
        print(bottomView, terminator: "")
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setChart(chartView: LineChartView, dataPoints: [String], values: [Double]){
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        

        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
        }
        //set data
        let chartDataSet = LineChartDataSet(yVals: dataEntries, label: "")
        chartDataSet.drawValuesEnabled = true
        
        let chartData = LineChartData(xVals: dataPoints, dataSet: chartDataSet)
        chartView.data = chartData
        chartDataSet.colors = colors
        //set value format
        chartDataSet.drawCircleHoleEnabled = false
        chartDataSet.drawValuesEnabled = false

        
        //set label, axis grid
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineColor = colors[2]
        chartView.xAxis.labelTextColor = colors[2]
        
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[1]
        chartView.leftAxis.setLabelCount(10, force: false)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[2]
        chartView.leftAxis.customAxisMax = 30
        chartView.leftAxis.customAxisMin = 0
        chartView.leftAxis.startAtZeroEnabled = false
//        chartView.notifyDataSetChanged()
        
        //set lenged
        chartView.legend.enabled = false
        chartView.backgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.descriptionText = ""
        
        
        let targetLine90 = ChartLimitLine(limit: 9, label: "9")
        let targetLine120 = ChartLimitLine(limit: 12, label: "12")
        chartView.leftAxis.addLimitLine(targetLine90)
        chartView.leftAxis.addLimitLine(targetLine120)
        
//        chartView.setNeedsDisplay()
        
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
