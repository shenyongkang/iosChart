//
//  CombineViewController.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/14.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import UIKit
import Charts

class CombineViewController: UIViewController {


    @IBOutlet weak var combineViewChart: CombinedChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [21.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(months, values: unitsSold)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChart(dataPoints: [String], values: [Double]){
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        
        combineViewChart.drawOrder = [CombinedChartDrawOrder.Line.rawValue, CombinedChartDrawOrder.Bubble.rawValue]
        
        var dataEntries: [ChartDataEntry] = []
        var bubbleDataEntries:[BubbleChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let bubbleDataEntry = BubbleChartDataEntry(xIndex: i, value: values[i], size: 20)
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            bubbleDataEntries.append(bubbleDataEntry)
            
        }
        //set data
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "aa")
        let lineDataSet = LineChartDataSet(yVals: dataEntries)
        let bubbleDataSet = BubbleChartDataSet(yVals: bubbleDataEntries)
        bubbleDataSet.colors = [UIColor.whiteColor()]

        var combineData = CombinedChartData(xVals: dataPoints)
        combineData.lineData = LineChartData(xVals: dataPoints, dataSet: lineDataSet)
//        combineData.barData = BarChartData(xVals: dataPoints, dataSet: chartDataSet)
        combineData.bubbleData = BubbleChartData(xVals: dataPoints, dataSet: bubbleDataSet)
        combineViewChart.data = combineData
        combineViewChart.gridBackgroundColor = UIColor.whiteColor()

        
        
        //set animation
        combineViewChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseOutQuad)
        
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
