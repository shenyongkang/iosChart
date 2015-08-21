//
//  DrawChartsGuide.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/13.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import Foundation
import CoreGraphics
import Charts

class DrawchartsGuide{
    static func historyLine(frame: CGRect, data: [Double], labels: [String]) ->LineChartView{
        
        
        let dataLabels = labels
        let values = data
        let colors = [UIColor(red: 255/255, green: 93/255, blue: 60/255, alpha: 1),
            UIColor(red: 255/255, green: 150/255, blue: 108/255, alpha: 1),
]

        
        var dataEntries1: [ChartDataEntry] = []
        for i in 0..<dataLabels.count{
            
            let dataEntry1 = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries1.append(dataEntry1)
        }
        var chartView = LineChartView(frame: frame)
        
        
        let lineChartDataSet1 = LineChartDataSet(yVals: dataEntries1, label: "")
        
        //在dataset里设置线的颜色
        lineChartDataSet1.colors = [UIColor.whiteColor()]
        
        //折线节点圆圈设置
        lineChartDataSet1.drawCircleHoleEnabled = true
        lineChartDataSet1.circleHoleColor = colors[0]
        lineChartDataSet1.circleColors = [UIColor.whiteColor()]
        lineChartDataSet1.circleRadius = 5
        
        //value设置
        lineChartDataSet1.drawValuesEnabled = false
        //线宽设置
        lineChartDataSet1.lineWidth = 1.5

        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet1)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 2
        chartView.xAxis.labelTextColor = UIColor.whiteColor()
        
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(12)
//        chartView.xAxis.setLabelsToSkip(5)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[1]
        chartView.leftAxis.gridLineWidth = 0.5
        chartView.leftAxis.setLabelCount(3, force: false)
        chartView.leftAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[1]
        
        
        //value格式化
        var numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.positiveSuffix = "公里"
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //设置图片右边距
        chartView.extraRightOffset = 10
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.enabled = false
        
        //图像背景
        chartView.backgroundColor = colors[0]
        chartView.gridBackgroundColor = colors[0]
        
        
        
        //添加渐变
        var image = UIImage(named: "bg_guide")
        
        var backgroundImage = UIImageView(image: image)
        backgroundImage.contentMode = UIViewContentMode.ScaleToFill
        
        backgroundImage.alpha = 0.3
        backgroundImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        chartView.addSubview(backgroundImage)
        print(frame)
        print("\n")
        print(backgroundImage.frame)
        
        
        return chartView

    }
    
}