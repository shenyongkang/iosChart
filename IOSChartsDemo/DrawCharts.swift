//
//  DrawCharts.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/13.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import Foundation
import CoreGraphics
import Charts

public class DrawCharts{
    ///get home page view with (Double type Number, 25 elements)
    static func homePageView1(frame: CGRect, data: [Double]) ->LineChartView{
        
        let dataLabels = [" 0:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00",
            "23:00", "24:00"]
        
        if (dataLabels.count > data.count){
            var tempView = LineChartView(frame: frame)
            tempView.noDataText = "data should be Double type Number, 25 elements "
            return tempView
            
        }
        
        let values = data
        
        let colors = [UIColor(red: 77/255, green: 190/255, blue: 206/255, alpha: 0.9),
            UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.9),
            UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1),]
        
        var dataEntries1: [ChartDataEntry] = []
        for i in 0..<dataLabels.count{
            
            let dataEntry1 = ChartDataEntry(value: values[i] / 1000, xIndex: i)
            dataEntries1.append(dataEntry1)
        }
        var chartView = LineChartView(frame: frame)
        
        
        let lineChartDataSet1 = LineChartDataSet(yVals: dataEntries1, label: "data 1")
        
        //在dataset里设置线的颜色
        lineChartDataSet1.colors = [colors[0]]
        
        //折线节点圆圈设置
        //不显示圆圈
        lineChartDataSet1.drawCircleHoleEnabled = false
        lineChartDataSet1.circleRadius = 0
        //value设置
        lineChartDataSet1.drawValuesEnabled = false
        //线宽设置
        lineChartDataSet1.lineWidth = 1
        
        //设置填充、填充颜色
        lineChartDataSet1.drawFilledEnabled = true
        lineChartDataSet1.fillColor = colors[0]
        lineChartDataSet1.fillAlpha = 2
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet1)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineColor = colors[2]
        chartView.xAxis.axisLineWidth = 2
        chartView.xAxis.labelTextColor = colors[2]
        
        chartView.xAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.xAxis.setLabelsToSkip(5)
        
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
        numberFormatter.positiveSuffix = "K"
        chartView.leftAxis.valueFormatter = numberFormatter
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        
        
        //设置图片右边距
//        chartView.extraRightOffset = 15
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.enabled = false
        
        
        //图像背景
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.gridBackgroundColor = UIColor.whiteColor()
        return chartView
    }
    
    /// get blood Presure Monitor Chart with (3 group Double type number ,every gourp with 7 elements),
    static public func bloodPressureMonitor(frame: CGRect, data: [[Double]]) ->LineChartView{
        
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        
        let dataLabels = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]
        let values = data
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<dataLabels.count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: j)
                entries.append(dataEntry)
            }
            dataEntries.append(entries)
            
        }

        var chartView = LineChartView(frame: frame)
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "收缩压"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "舒张压"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[2], label: "心率"))
        
        
        for i in 0..<lineChartDataSets.count{
            lineChartDataSets[i].colors = [colors[i]]
            lineChartDataSets[i].drawCircleHoleEnabled = false
            lineChartDataSets[i].circleColors = [colors[i]]
            lineChartDataSets[i].circleRadius = 3
//            lineChartDataSets[i].drawCubicEnabled = false
            lineChartDataSets[i].drawValuesEnabled = false
            lineChartDataSets[i].lineWidth = 1
        }
        
        
        //设置data

        let lineChartData = LineChartData(xVals: dataLabels, dataSets: lineChartDataSets)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 0
        chartView.xAxis.labelTextColor = colors[2]
        chartView.xAxis.spaceBetweenLabels = 1
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[1]
        chartView.leftAxis.gridLineWidth = 0.5
//        chartView.leftAxis.setLabelCount(8, force: false)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[2]
        //  chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.customAxisMin = 0
        chartView.leftAxis.customAxisMax = 200
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartCenter
        
        

    
        return chartView
        
    }
    
}