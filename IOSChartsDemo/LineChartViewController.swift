//
//  LineChartViewController.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/5.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {

    @IBOutlet weak var lineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 14.0, 6.0, 3.0, 12.0, 16.0, 14.0, 18.0, 12.0, 14.0, 15.0, 14.0]
        
        setChart(months, values: unitsSold)

        // Do any additional setup after loading the view.
    }

    
    func setChart(dataPoints: [String], values: [Double]){
        
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 1),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 1),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 1),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 1),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 1)]
        
        var dataEntries1: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry1 = ChartDataEntry(value: values[i], xIndex: i)
            let dataEntry2 = ChartDataEntry(value: values[i] * 0.5, xIndex: i)
            dataEntries1.append(dataEntry1)
            dataEntries2.append(dataEntry2)
        }
        

        
        let lineChartDataSet1 = LineChartDataSet(yVals: dataEntries1, label: "data 1")
        let lineChartDataSet2 = LineChartDataSet(yVals: dataEntries2, label: "data 2")

        
            
        //在dataset里设置线的颜色
        lineChartDataSet1.colors = [colors[1]]
        lineChartDataSet2.colors = [colors[2]]

        //折线节点圆圈设置
        lineChartDataSet1.drawCircleHoleEnabled = false

//        lineChartDataSet1.circleHoleColor = colors[3]
        lineChartDataSet1.circleColors = [colors[1]]
        lineChartDataSet1.circleRadius = 6
        
        lineChartDataSet2.drawCircleHoleEnabled = false
        //        lineChartDataSet2.circleHoleColor = colors[1]
        lineChartDataSet2.circleColors = [colors[2]]
        lineChartDataSet2.circleRadius = 5
        
        //value设置
        lineChartDataSet1.drawValuesEnabled = false
        lineChartDataSet2.drawValuesEnabled = false
//        lineChartDataSet2.valueFont = UIFont.systemFontOfSize(10)
//        lineChartDataSet2.valueTextColor = colors[2]
        //线宽设置
        lineChartDataSet1.lineWidth = 2
        lineChartDataSet2.lineWidth = 2

        
        
        //设置data
        var chartDataSets: [ChartDataSet] = []
        chartDataSets.append(lineChartDataSet1)
        chartDataSets.append(lineChartDataSet2)
//        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        let lineChartData = LineChartData(xVals: dataPoints, dataSets: chartDataSets)
        
        lineChartView.data = lineChartData
        
        //设置动画
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)     
        
        
        //设置X Y 轴 及xy轴label 网格参数
        
        lineChartView.xAxis.labelPosition = .Bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.axisLineColor = colors[2]
        lineChartView.xAxis.labelTextColor = colors[2]
        lineChartView.xAxis.spaceBetweenLabels = 1

        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.drawAxisLineEnabled = false
        lineChartView.leftAxis.gridColor = colors[1]
//        lineChartView.leftAxis.setLabelCount(8, force: false)
        
        lineChartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        lineChartView.leftAxis.labelTextColor = colors[2]
        
        lineChartView.leftAxis.startAtZeroEnabled = false
        lineChartView.leftAxis.customAxisMin = -5
        lineChartView.leftAxis.customAxisMax = 30


        
        //设置图像description
        lineChartView.descriptionText = ""
//        lineChartView.legend.enabled = false
        //设置图像背景
        lineChartView.gridBackgroundColor = UIColor.brownColor()
        lineChartView.backgroundColor = UIColor.brownColor()
        
        
        
    }
    
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
