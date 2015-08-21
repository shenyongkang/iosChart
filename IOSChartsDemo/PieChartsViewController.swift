//
//  PieChartsViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import Charts
import UIKit

class PieChartsViewController: UIViewController {
    

    @IBOutlet weak var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        setChart(months, values: unitsSold)
        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Double]){
        
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 220/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        pieChartView.descriptionText = ""
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        //数据设置
        let pieChartDataSet = PieChartDataSet(yVals: Array(dataEntries[0..<6]) ,label: "")
        let pieChartData = PieChartData(xVals: Array(dataPoints[0..<6]), dataSet: pieChartDataSet)
        pieChartDataSet.colors = colors
          //设置扇形区域字体
        pieChartDataSet.valueFont = UIFont.systemFontOfSize(12)
        pieChartDataSet.valueTextColor = UIColor.whiteColor()
        
        pieChartView.data = pieChartData
        
        //动画设置
        pieChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //中心区域文字设置
        pieChartView.centerText = "First Try"
        //中心区域比例
        pieChartView.holeRadiusPercent = 0.4
        //中心带边框比例
        pieChartView.transparentCircleRadiusPercent = 0.5
        //百分比显示,注：usePercentValuesEnabled 返回的是不带百分号的百分比
        pieChartView.usePercentValuesEnabled = true
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.positiveSuffix = "%"
        pieChartView.valueFormatter = numberFormatter
        //扇形区域内容显示
        pieChartView.drawSliceTextEnabled = true
        
        //图示说明
        pieChartView.legend.enabled = true
        pieChartView.legend.position = ChartLegend.ChartLegendPosition.RightOfChartCenter
        var labels = ["a","b","c","d","e","f"]
        pieChartView.legend.setCustom(colors: colors, labels: Array(dataPoints[0..<6]))
        pieChartView.legend.formSize = 10
        pieChartView.legend.textColor = colors[2]
        
        
        
        
        

        
        
        
        
    }

}
