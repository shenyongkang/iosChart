//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate{


    @IBOutlet weak var barChartView: BarChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.delegate = self
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [21.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(months, values: unitsSold)
        println("here")
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight){
        println("\(entry.value) in \(entry.xIndex)")
    }
    
    func setChart(dataPoints: [String], values: [Double]){
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        
        barChartView.noDataText = "You need to provide data for the chart."
        barChartView.descriptionText = ""
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
        }
        //set data
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        chartDataSet.drawValuesEnabled = true
        // space indicator between the bars in percentage of the whole width of one value (0.15 == 15% of bar width)

        chartDataSet.barSpace = 0.2
        let chartData = BarChartData(xVals: dataPoints, dataSet: chartDataSet)
        barChartView.data = chartData
        chartDataSet.colors = colors
        //set value format
        chartDataSet.valueFont = UIFont.systemFontOfSize(10)
        chartDataSet.valueTextColor = colors[2]
        
        //set label, axis grid
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.axisLineColor = colors[2]
        barChartView.xAxis.labelTextColor = colors[2]
//        barChartView.xAxis.labelFont = UIFont.systemFontOfSize(6)
        //setLabelsToSkip will disable spaceBetweenLabels
//        barChartView.xAxis.setLabelsToSkip(0)
        
        barChartView.xAxis.spaceBetweenLabels = 1
        
        barChartView.rightAxis.enabled = false
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.leftAxis.gridColor = colors[1]
        barChartView.leftAxis.setLabelCount(10, force: false)
        barChartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        barChartView.leftAxis.labelTextColor = colors[2]
       
        //set lenged
        barChartView.legend.enabled = false
        
        
        //set animation
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseOutQuad)
        
        
        
        //target line
//        var limitLine = ChartLimitLine(limit: 16.0, label: "Target")
//        limitLine.lineColor = UIColor(red: 220/255, green: 37/255, blue: 167/255, alpha: 1)
//        barChartView.rightAxis.addLimitLine(limitLine)
        
    }


}

