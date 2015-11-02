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
    
    ///get pedometer monitor chart
    static public func pedometerMonitor(frame: CGRect, data: [Int], labels: [String]) ->UIView{
        
        let myView = UIView(frame: frame)
        let colors = [
            UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1),
            UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        if data.count == 0 || labels.count == 0 {
            let tempChart = HorizontalBarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        
        let values = data
        var dataLabels: [String] = []
        for item in labels{
            
            dataLabels.append(item)
            dataLabels.append("")
        }
        dataLabels.removeLast()
        
        var xValues: [Int] = []
        for i in 0..<values.count{
            xValues.append(2 * i)
        }
        
        
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: Double(values[i]), xIndex: xValues[i])
            dataEntries.append(dataEntry)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "步数")
        
        
        
        lineChartDataSet.colors = [colors[0]]
        lineChartDataSet.drawCircleHoleEnabled = false
        lineChartDataSet.circleColors = [colors[0]]
        lineChartDataSet.circleRadius = 3
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.lineWidth = 1
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.descriptionText = ""
        
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawLabelsEnabled = true
        chartView.leftAxis.labelTextColor = colors[1]
        chartView.leftAxis.drawGridLinesEnabled = false

        
        
        chartView.leftAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineColor = colors[1]
        chartView.leftAxis.axisLineWidth = 0.5
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.labelTextColor = colors[1]
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[1]
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.xAxis.axisLineWidth = 0.5
        
        chartView.rightAxis.enabled = true
        chartView.rightAxis.drawLabelsEnabled = false
//        chartView.extraRightOffset = 15
        chartView.rightAxis.drawGridLinesEnabled = true

        chartView.rightAxis.setLabelCount(8, force: true)
        chartView.rightAxis.gridColor = colors[1]
        chartView.rightAxis.gridLineDashLengths = [3.0, 3.0]
        
        
        
        
        chartView.rightAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineColor = colors[1]
        chartView.rightAxis.axisLineWidth = 0.5

        
        
        chartView.legend.enabled = false
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[4]
        //        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[4]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景

        myView.addSubview(chartView)
        
        return myView
        
    }
    
    /// get sleep analysis one day chart method two
    static public func sleepAnalysisOneDay2(frame: CGRect,sleepDuration: [Int], sleepType: [String], startTime: Int) ->BarChartView {
        let colors = [UIColor(red: 11/255, green: 55/255, blue: 144/255, alpha: 1),
            UIColor(red: 48/255, green: 120/255, blue: 254/255, alpha: 1),
            UIColor(red: 123/255, green: 179/255, blue: 254/255, alpha: 1),
            UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            
        ]
        if sleepDuration.count == 0 || 0 == sleepType.count {
            let tempChart = HorizontalBarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        if sleepDuration.count != sleepType.count {
            let tempChart = HorizontalBarChartView(frame: frame)
            tempChart.noDataText = "Chart数据错误"
            return tempChart
        }
 
        
        var values = [Double]()
        var dataLabels = [String]()
        var colorsList = [UIColor]()
        for i in 0..<sleepDuration.count {
            let duration = sleepDuration[i]
            var value:Double = 0.0
            var colorIndex:Int = 4
            switch sleepType[i]{
            case "D" :
                value = 3.0
                colorIndex = 0
            case "S" :
                value = 2.0
                colorIndex = 1
            case "A" :
                value = 1.0
                colorIndex = 2
            case "N" :
                value = 3.5
                colorIndex = 4
            default:
                value = 0.0
                colorIndex = 4
                
                
            }
            
            for _ in 0..<duration{
                values.append(value)
                colorsList.append(colors[colorIndex])
                dataLabels.append("")
                
            }
            
        }
        var sleepLabels = [String]()
        for i in 0...24{
            if i % 8 == 0{
                sleepLabels.append(String((startTime + i) % 24 ) + ":00")
            }
            
        }
        dataLabels[0] = sleepLabels[0]
        
        
        
        
        
        for i in 1..<sleepLabels.count{
            if  dataLabels.count > (480 * i ) {
                dataLabels[480 * i ] = sleepLabels[i]

            }
        }
        dataLabels.append(sleepLabels[sleepLabels.count - 1])
//        print(values.count)
        let chartView = BarChartView(frame: frame)
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
        }
        
        print(dataEntries.count)
        
        let barChartDataSet: BarChartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        barChartDataSet.barSpace = 0
        
        barChartDataSet.colors = colorsList
        barChartDataSet.drawValuesEnabled = false
        print(dataLabels.count)
        let barChartData = BarChartData(xVals: dataLabels, dataSet: barChartDataSet)
        chartView.data = barChartData
        
        
        
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.labelPosition = .Bottom
        chartView.descriptionText = ""
        
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.gridColor = colors[3]
        chartView.leftAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineColor = colors[3]
        chartView.leftAxis.axisLineWidth = 0.5
        chartView.leftAxis.setLabelCount(13, force: true)
        
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[3]
        chartView.xAxis.setLabelsToSkip(119)
        chartView.xAxis.avoidFirstLastClippingEnabled = false
        chartView.extraLeftOffset = 15
        chartView.extraRightOffset = 15
        
        
        chartView.rightAxis.enabled = true
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.rightAxis.gridColor = colors[3]
        chartView.rightAxis.setLabelCount(13, force: true)
        chartView.rightAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineColor = colors[3]
        chartView.rightAxis.axisLineWidth = 0.5
        
        
        
        chartView.backgroundColor = colors[5]
        chartView.gridBackgroundColor = colors[5]
        chartView.legend.enabled = false
        
        chartView.notifyDataSetChanged()
        chartView.setScaleEnabled(false)
        chartView.userInteractionEnabled = false
        
        
        return chartView
        
        
    }
    
    
    
    
    
    /// get sleep analysis one day chart
    static public func sleepAnalysisOneDay(frame: CGRect,sleepDuration: [Double], sleepType: [String]) ->HorizontalBarChartView {
        let colors = [UIColor(red: 11/255, green: 55/255, blue: 144/255, alpha: 1),
            UIColor(red: 48/255, green: 120/255, blue: 254/255, alpha: 1),
            UIColor(red: 123/255, green: 179/255, blue: 254/255, alpha: 1),
            UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            
        ]
        if sleepDuration.count == 0 && sleepType.count == 0 {
            let tempChart = HorizontalBarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        
        if sleepDuration.count != sleepType.count {
            let tempChart = HorizontalBarChartView(frame: frame)
            tempChart.noDataText = "Chart数据错误"
            return tempChart
        }

        var values: [[Double]] = [[Double]](count: 4, repeatedValue: [])
        let dataLabels: [String] = [String](count: 4, repeatedValue: "")
        var colorsList: [UIColor] = []
        for i in 0..<sleepDuration.count {
            let duration = sleepDuration[i] / 60.0

            if sleepType[i] == "S"{
                values[0].append(duration)
                values[1].append(duration)
                values[2].append(0)
                values[3].append(0)
                
                values[0].append(0)
                values[1].append(0)
                values[2].append(duration)
                values[3].append(duration)

                colorsList.append(colors[1])
                colorsList.append(colors[4])
            }
            if sleepType[i] == "D"{
                values[0].append(duration)
                values[1].append(duration)
                values[2].append(duration)
                values[3].append(0)
                
                values[0].append(0)
                values[1].append(0)
                values[2].append(0)
                values[3].append(duration)

                colorsList.append(colors[0])
                colorsList.append(colors[4])
            }
            if sleepType[i] == "A"{
                values[0].append(duration)
                values[1].append(0)
                values[2].append(0)
                values[3].append(0)
                values[0].append(0)
                values[1].append(duration)
                values[2].append(duration)
                values[3].append(duration)

                colorsList.append(colors[2])
                colorsList.append(colors[4])
            }
            if sleepType[i] == "N"{
                values[0].append(0)
                values[1].append(0)
                values[2].append(0)
                values[3].append(0)
                
                values[0].append(duration)
                values[1].append(duration)
                values[2].append(duration)
                values[3].append(duration)

                colorsList.append(colors[4])
                colorsList.append(colors[4])
            }
            
        }
        let chartView = HorizontalBarChartView(frame: frame)
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = BarChartDataEntry(values: values[i], xIndex: i)
            dataEntries.append(dataEntry)
            
        }
        
//        print(dataEntries)
        
        let barChartDataSet: BarChartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        barChartDataSet.barSpace = -0.01
        
        barChartDataSet.colors = colorsList
        barChartDataSet.drawValuesEnabled = false
        
        let barChartData = BarChartData(xVals: dataLabels, dataSet: barChartDataSet)
        chartView.data = barChartData
        
        
        let numberFormatter = NSNumberFormatter()

        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.labelPosition = .Bottom
        chartView.descriptionText = ""
        
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.customAxisMin = 0.0
        chartView.leftAxis.customAxisMax = 24.0

        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineColor = colors[3]
        chartView.leftAxis.axisLineWidth = 0.5
        
        
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[3]
        chartView.xAxis.axisLineColor = colors[3]
        chartView.xAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.xAxis.axisLineWidth = 0.5
        
        chartView.rightAxis.enabled = true
        chartView.rightAxis.drawLabelsEnabled = true
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.positiveSuffix = ":00"
        chartView.rightAxis.valueFormatter = numberFormatter
        chartView.extraRightOffset = 15
        chartView.rightAxis.drawGridLinesEnabled = true
        chartView.rightAxis.startAtZeroEnabled = false
        chartView.rightAxis.customAxisMin = 0.0
        chartView.rightAxis.customAxisMax = 24.0
        chartView.rightAxis.setLabelCount(7, force: true)
        
        chartView.rightAxis.gridColor = colors[3]
        chartView.rightAxis.gridLineDashLengths = [3.0, 3.0]
        
        
        
        
        chartView.rightAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineColor = colors[3]
        chartView.rightAxis.axisLineWidth = 0.5
        
        
        
        chartView.backgroundColor = colors[5]
        chartView.gridBackgroundColor = colors[5]
        chartView.legend.enabled = false
        
        chartView.notifyDataSetChanged()
        chartView.setScaleEnabled(false)
        chartView.userInteractionEnabled = false
        

        
        return chartView
        
        
    }
    
    /// get sleep analysis one week chart
    static public func sleepAnalysisOneWeek(frame: CGRect, data: [[Double]], labels: [String]) ->BarChartView {
        
        
        let colors = [UIColor(red: 11/255, green: 55/255, blue: 144/255, alpha: 1),
            UIColor(red: 48/255, green: 120/255, blue: 254/255, alpha: 1),
            UIColor(red: 123/255, green: 179/255, blue: 254/255, alpha: 1),
            UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1),
            UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            
        ]
        
        if data.count == 0 || labels.count == 0 {
            let tempChart = BarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
        }
        
        if labels.count != data.count || labels.count == 0 {
            let tempChart = BarChartView(frame: frame)
            tempChart.noDataText = "Chart数据错误"
        }



        
        let dataLabels: [String] = labels
        let values = data
        
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = BarChartDataEntry(values: values[i], xIndex: i)
            dataEntries.append(dataEntry)

        }
        
//        print(dataEntries)
        
        let chartView = BarChartView(frame: frame)
        let barChartDataSet: BarChartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        barChartDataSet.stackLabels = ["浅睡眠", "深睡眠", "活动"]
        barChartDataSet.barSpace = 0.1
            
        barChartDataSet.colors = [] + colors[0..<3]
        barChartDataSet.drawValuesEnabled = false
            
        let barChartData = BarChartData(xVals: dataLabels, dataSet: barChartDataSet)
        chartView.data = barChartData
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.labelPosition = .Bottom
        chartView.descriptionText = ""
        
        chartView.leftAxis.enabled = true
        chartView.leftAxis.drawLabelsEnabled = false
        chartView.leftAxis.gridColor = colors[3]
        chartView.leftAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.axisLineColor = colors[3]
        chartView.leftAxis.axisLineWidth = 0.5
        chartView.leftAxis.setLabelCount(6, force: true)
        
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[3]
    
        
        chartView.rightAxis.enabled = true
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.rightAxis.gridColor = colors[3]
        chartView.rightAxis.setLabelCount(6, force: true)
        chartView.rightAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineDashLengths = [3.0, 3.0]
        chartView.rightAxis.axisLineColor = colors[3]
        chartView.rightAxis.axisLineWidth = 0.5

        
        
        
        chartView.backgroundColor = colors[4]
        chartView.gridBackgroundColor = colors[4]
        chartView.legend.enabled = false
        
        chartView.notifyDataSetChanged()
        chartView.setScaleEnabled(false)
        chartView.userInteractionEnabled = false

        return chartView
        

    
        
    }
    
    
    ///get temperature chart
    static public func  temperatureAnalysis(frame: CGRect, data: [Double], labels: [String]) ->UIView {
        let myView = UIView(frame: frame)
        let colors = [
            UIColor(red: 75/255, green: 189/255, blue: 210/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        if data.count == 0 || labels.count == 0 {
            let tempChart = BarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        
        let values = data
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        
        var xValues: [Int] = []
        for i in 0..<values.count{
            xValues.append(2 * i + 1)
        }

        
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: xValues[i])
            dataEntries.append(dataEntry)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "体温")
        
        
        
        lineChartDataSet.colors = [colors[0]]
        lineChartDataSet.drawCircleHoleEnabled = false
        lineChartDataSet.circleColors = [colors[0]]
        lineChartDataSet.circleRadius = 3
        //            lineChartDataSet.drawCubicEnabled = false
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.lineWidth = 1
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
        //        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.gridLineWidth = 0.3
        chartView.xAxis.gridColor = colors[1]
        chartView.xAxis.labelTextColor = colors[3]
        chartView.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Top
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        //        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(12)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.customAxisMin = 35.5
        chartView.leftAxis.customAxisMax = 41.5
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.leftAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.gridColor = colors[1]
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 0.3
        chartView.leftAxis.setLabelCount(13, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.labelTextColor = colors[2]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        chartView.leftAxis.valueFormatter = numberFormatter
        
        
        chartView.legend.enabled = false
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[4]
        //        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[4]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景
        addTemperatureBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
        
        return myView
    }

    //********************************************************************************************************
    
    ///get temperature chart
    static public func  temperature(frame: CGRect, data: [Double], xValues: [Int]) ->UIView {
        let myView = UIView(frame: frame)
        let colors = [
            UIColor(red: 75/255, green: 189/255, blue: 210/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        if data.count == 0 || xValues.count == 0 {
            let tempChart = BarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        let values = data
        

        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: xValues[i])
            dataEntries.append(dataEntry)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "体温")
        
        
        
        lineChartDataSet.colors = [colors[0]]
        lineChartDataSet.drawCircleHoleEnabled = false
        lineChartDataSet.circleColors = [colors[0]]
        lineChartDataSet.circleRadius = 3
        //            lineChartDataSet.drawCubicEnabled = false
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.lineWidth = 1
        let dataLabels = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21","22", "23", "24"]
        
        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
//        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.gridLineWidth = 0.3
        chartView.xAxis.gridColor = colors[1]
        chartView.xAxis.labelTextColor = colors[3]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
//        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(12)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.customAxisMin = 35.5
        chartView.leftAxis.customAxisMax = 41.5
        chartView.leftAxis.drawGridLinesEnabled = true
        chartView.leftAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.gridColor = colors[1]
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 0.3
        chartView.leftAxis.setLabelCount(13, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.labelTextColor = colors[2]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        chartView.leftAxis.valueFormatter = numberFormatter
        
        
        chartView.legend.enabled = false
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[4]
        //        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[4]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景
        addTemperatureBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
        
        return myView
    }
    
    
    //********************************************************************************************************
    
    ///get body height analysis chart
    static public func bodyHeightAnalysis(frame: CGRect, data: [[Double]], labels: [String]) ->UIView{
        let myView = UIView(frame: frame)

        if data.count == 0 || labels.count == 0 || data[0].count == 0{
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        if data.count != 2{
            let tempView = LineChartView(frame: frame)
            tempView.noDataText = "error data ,need 2*7 Array"
            return tempView
        }
        
        let colors = [UIColor(red: 92/255, green: 165/255, blue: 169/255, alpha: 1),
            UIColor(red: 0/255, green: 155/255, blue: 66/255, alpha: 1),
            UIColor(red: 93/255, green: 195/255, blue: 200/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)]

        
        let dataLabels: [String] = labels
        let values = data
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: j)
                entries.append(dataEntry)
            }
            dataEntries.append(entries)
        }
        
        
        let chartView = LineChartView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "身高曲线"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "同龄曲线"))

        
        for i in 0..<lineChartDataSets.count{
            
            lineChartDataSets[i].colors = [colors[i]]
            lineChartDataSets[i].drawCircleHoleEnabled = false
            lineChartDataSets[i].circleColors = [colors[i]]
            lineChartDataSets[i].circleRadius = 0
//             lineChartDataSets[i].drawCubicEnabled = true
            lineChartDataSets[i].drawValuesEnabled = false
            lineChartDataSets[i].drawFilledEnabled = true
            lineChartDataSets[i].fillAlpha = 0.5
            lineChartDataSets[i].fillColor = colors[2]
            lineChartDataSets[i].lineWidth = 1
        }
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSets: lineChartDataSets)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[4]
        chartView.xAxis.gridLineWidth = 0.3
        chartView.xAxis.drawAxisLineEnabled = false

        chartView.xAxis.labelTextColor = colors[5]
        
        chartView.xAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.xAxis.spaceBetweenLabels = 1
//        chartView.xAxis.setLabelsToSkip(5)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[4]
        chartView.leftAxis.gridLineWidth = 0.3
        chartView.leftAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.leftAxis.setLabelCount(7, force: false)
        chartView.leftAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[3]
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        
        //设置图片右边距
//        chartView.extraRightOffset = 15
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.enabled = false
        
        //图像background legend
        chartView.backgroundColor = colors[6]
        chartView.gridBackgroundColor = colors[6]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        
        // add gradient layer
        let gradientview = UIView(frame: chartView.contentRect)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: chartView.contentRect.width, height: chartView.contentRect.height)
        let color1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.35).CGColor as CGColorRef
        let color4 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.65).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientview.layer.addSublayer(gradientLayer)
        
        myView.addSubview(chartView)
        myView.addSubview(gradientview)
        
        return myView
        
    }
    
    //********************************************************************************************************

    
    ///get body height chart
    static public func bodyHeight(frame: CGRect, data: [Double], labels: [String]) ->UIView {
        let myView = UIView(frame: frame)
        
        if data.count == 0 || labels.count == 0 {
            let tempChart = BarChartView(frame: frame)
            tempChart.noDataText = "没有数据"
            return tempChart
        }
        
        let colors = [UIColor(red: 11/255, green: 209/255, blue: 80/255, alpha: 1),
            UIColor(red: 249/255, green: 153/255, blue: 38/255, alpha: 1),
            UIColor(red: 75/255, green: 189/255, blue: 210/255, alpha: 1),
            UIColor(red: 30/255, green: 250/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        let values = data
        
        var xValues: [Int] = []
        for i in 0..<values.count{
            xValues.append(2 * i + 1)
        }
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: xValues[i])
            dataEntries.append(dataEntry)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "身高")
        
        
    
        lineChartDataSet.colors = [colors[2]]
        lineChartDataSet.drawCircleHoleEnabled = false
        lineChartDataSet.circleColors = [colors[2]]
        lineChartDataSet.circleRadius = 3
        //            lineChartDataSet.drawCubicEnabled = false
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.lineWidth = 1

        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[5]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(12)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.customAxisMin = 30
        chartView.leftAxis.customAxisMax = 210
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 1
        chartView.leftAxis.setLabelCount(10, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.labelTextColor = colors[6]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        

        chartView.legend.enabled = false
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[7]
        //        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[7]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景
        addBodyHeightBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
        
        return myView
    }
    
    //********************************************************************************************************
    
    ///get body weight chart
    static public func bodyWeight(frame: CGRect, data: [[Double]], labels: [String]) ->UIView {
        let myView = UIView(frame: frame)
        

        if data.count == 0 || labels.count == 0 || data[0].count == 0{
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        if data.count != 2{
            let tempView = LineChartView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            tempView.noDataText = "error data need 2*7 Array"
            return tempView
        }
        
        let colors = [UIColor(red: 11/255, green: 209/255, blue: 80/255, alpha: 1),
            UIColor(red: 75/255, green: 189/255, blue: 210/255, alpha: 1),
            UIColor(red: 249/255, green: 153/255, blue: 38/255, alpha: 1),
            UIColor(red: 30/255, green: 250/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        let values = data
        
        var xValues: [[Int]] = []
        for i in 0..<values.count{
            var tempXValues: [Int] = []
            for j in 0..<values[i].count{
                tempXValues.append(2 * j + 1)
            }
            xValues.append(tempXValues)
        }
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: xValues[i][j])
                entries.append(dataEntry)
            }
            dataEntries.append(entries)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "体重"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "BMI"))
        
        
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
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[5]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(13)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.customAxisMin = 10
        chartView.leftAxis.customAxisMax = 100
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 1
        chartView.leftAxis.setLabelCount(10, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.labelTextColor = colors[6]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //target line
        let targetLine185 = ChartLimitLine(limit: 18.5, label: "BMI 18.5")
        let targetLine249 = ChartLimitLine(limit: 24.9, label: "BMI 24.9")
        targetLine185.lineDashLengths = [3.0, 3.0]
        targetLine185.lineColor = colors[3]
        targetLine185.lineWidth = 0.5
        targetLine185.valueTextColor = colors[6]
        targetLine185.valueFont = UIFont.systemFontOfSize(9)

        targetLine249.lineDashLengths = [3.0, 3.0]
        targetLine249.lineColor = colors[4]
        targetLine249.lineWidth = 0.5
        targetLine249.valueTextColor = colors[4]
        targetLine249.valueFont = UIFont.systemFontOfSize(9)
        
        chartView.leftAxis.addLimitLine(targetLine185)
        chartView.leftAxis.addLimitLine(targetLine249)
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[7]
        //        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[7]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景
        addBodyWeightBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
        
        return myView
    }
    
    
    //********************************************************************************************************
    
    /// get body fat analysis diagram page chart 1
    static public func bodyFatAnalysisChart1(frame: CGRect, data: [[Double]]) ->BarChartView{
        
        
        if data.count != 2 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataTextDescription = "data: 2*2 array"
            return tempView
        }
        if data.count == 0 || data[0].count == 0{
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
            
        }
        
        var colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)]
        
        let dataLabels: [String] = ["最高值", "最低值"]
        let values = data
        

        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: values[0].count, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
        //        print(dataEntries)
        
        let chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.4
            barChartDataSets[i].valueFont = UIFont.boldSystemFontOfSize(12)
            let numberFormatter = NSNumberFormatter()
            numberFormatter.maximumFractionDigits = 1
            barChartDataSets[i].valueFormatter = numberFormatter
            
            barChartDataSets[i].colors = [colors[i]]
//            barChartDataSets[i].drawValuesEnabled = false
            
        }
        let barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 1.2
        chartView.data = barChartData
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = colors[2]
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        chartView.xAxis.setLabelsToSkip(0)
        
        chartView.xAxis.labelTextColor = colors[2]
        
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.extraTopOffset = 20
        chartView.extraBottomOffset = 10
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        //动作
        chartView.userInteractionEnabled = false
        chartView.notifyDataSetChanged()
//        chartView.backgroundColor = UIColor.brownColor()

        return chartView
        
    }
    
    //********************************************************************************************************
    
    /// get body fat analysis diagram page chart 2
    static public func bodyFatAnalysisChart2(frame: CGRect, data: [[Double]]) ->BarChartView{
        
        if data.count != 3 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataTextDescription = "data: 3*2 array"
            return tempView
        }
        if data.count == 0 ||  data[0].count == 0{
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        
        let colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)]
        
        let dataLabels: [String] = ["早上", "晚上", "其他"]
        let values = data
        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: values[0].count, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
        //        print(dataEntries)
        
        let chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.4
            let numberFormatter = NSNumberFormatter()
            numberFormatter.maximumFractionDigits = 1
            barChartDataSets[i].valueFormatter = numberFormatter
            barChartDataSets[i].colors = [colors[i]]
            barChartDataSets[i].valueFont = UIFont.boldSystemFontOfSize(12)
//            barChartDataSets[i].drawValuesEnabled = false
            
        }
        let barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 1.2
        chartView.data = barChartData
        //        chartView.xAxis.enabled = false
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = colors[2]
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        chartView.xAxis.labelTextColor = colors[2]
        chartView.xAxis.setLabelsToSkip(0)
        
        chartView.xAxis.labelTextColor = UIColor.blackColor()
        chartView.extraBottomOffset = 10
        chartView.extraTopOffset = 20
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        chartView.setScaleEnabled(false)
        //动作
        chartView.userInteractionEnabled = false
//        chartView.backgroundColor = UIColor.brownColor()
        chartView.notifyDataSetChanged()
        return chartView
        
    }
    
    
    //********************************************************************************************************
    
    /// get body fat analysis diagram page chart 3
    static public func bodyFatAnalysisChart3(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        return analysisChart3(frame: frame, normalCount: normalCount, highCount: highCount, lowCount: lowCount)
        
    }
    
    //********************************************************************************************************
    
    ///get blood fat monitor chart
    static public func bodyFatMonitor(frame: CGRect, data: [[Double]], labels: [String]) ->UIView {
        let myView = UIView(frame: frame)
        
        if data.count == 0 || labels.count == 0 || data[0].count == 0{
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return  tempView
        }
        
        if data.count != 3{

            let tempView = LineChartView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            tempView.noDataTextDescription = "error data need 3*7 Array"
            return tempView
        }

        
        
        let colors = [UIColor(red: 11/255, green: 209/255, blue: 80/255, alpha: 1),
            UIColor(red: 249/255, green: 153/255, blue: 38/255, alpha: 1),
            UIColor(red: 75/255, green: 189/255, blue: 210/255, alpha: 1),
            UIColor(red: 30/255, green: 250/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        let values = data
        
        var xValues: [[Int]] = []
        for i in 0..<values.count{
            var tempXValues: [Int] = []
            for j in 0..<values[i].count{
                tempXValues.append(2 * j + 1)
            }
            xValues.append(tempXValues)
        }
        
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: xValues[i][j])
                entries.append(dataEntry)
            }
            dataEntries.append(entries)
            
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "体重"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "体脂率"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[2], label: "BMI"))
        
        
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
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[5]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        chartView.xAxis.setLabelsToSkip(0)
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.customAxisMin = 0
        chartView.leftAxis.customAxisMax = 120
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 1
        chartView.leftAxis.setLabelCount(7, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[6]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //target line
        let targetLine185 = ChartLimitLine(limit: 18.5, label: "BMI 18.5")
        let targetLine249 = ChartLimitLine(limit: 24.9, label: "BMI 24.9")
        targetLine185.lineDashLengths = [3.0, 3.0]
        targetLine185.lineColor = colors[3]
        targetLine185.lineWidth = 0.5
        targetLine185.valueTextColor = colors[6]
        targetLine185.valueFont = UIFont.systemFontOfSize(8)
        targetLine249.lineDashLengths = [3.0, 3.0]
        targetLine249.lineColor = colors[4]
        targetLine249.lineWidth = 0.5
        targetLine249.valueTextColor = colors[4]
        targetLine249.valueFont = UIFont.systemFontOfSize(8)
        
        chartView.leftAxis.addLimitLine(targetLine185)
        chartView.leftAxis.addLimitLine(targetLine249)
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[7]
//        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[7]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        //添加背景
        addBodyFatMonitorBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
        
        return myView
    }
        
    
    //********************************************************************************************************
    
    /// get body fat analysis curve page chart
    static public func bodyFatAnalysis(frame: CGRect, data: [[Double]], labels: [String]) ->LineChartView{
        
        
        if data.count != 3{
            let tempChartView = LineChartView(frame: frame)
            tempChartView.noDataTextDescription = "error data ,need 3*7 Array"
            return tempChartView
        }
        if data.count == 0 || labels.count == 0 || data[0].count == 0{
            let tempChartView = LineChartView(frame: frame)
            tempChartView.noDataText = "没有数据"
            return tempChartView
        }
        
        
        let colors = [UIColor(red: 61/255, green: 180/255, blue: 195/255, alpha: 1),
            UIColor(red: 239/255, green: 192/255, blue: 58/255, alpha: 1),
            UIColor(red: 151/255, green: 107/255, blue: 177/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 224/255, green: 55/255, blue: 43/255, alpha: 1),
            UIColor(red: 0/255, green: 0/255, blue: 246/255, alpha: 1),
            UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.8),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        let dataLabels: [String] = labels
        
        let values = data
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: j)
                entries.append(dataEntry)
            }
            
            dataEntries.append(entries)
            
        }
        
        
        let chartView = LineChartView(frame: frame)
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "体重（kg)   "))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "体脂率   "))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[2], label: "BMI   "))
        
        
        
        //        print(circleColors.count)
        
        for i in 0..<lineChartDataSets.count{
            
            lineChartDataSets[i].colors = [colors[i]]
            
            lineChartDataSets[i].drawCircleHoleEnabled = true
            lineChartDataSets[i].circleColors = [colors[i]]
            lineChartDataSets[i].circleRadius = 5
            //            lineChartDataSets[i].drawCubicEnabled = true
            lineChartDataSets[i].drawValuesEnabled = false
            lineChartDataSets[i].drawFilledEnabled = true
            lineChartDataSets[i].fillColor = colors[i]
            lineChartDataSets[i].fillAlpha = 0.3
            
            lineChartDataSets[i].lineWidth = 1
        }
        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSets: lineChartDataSets)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineWidth = 0.5
        //        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[3]
        chartView.xAxis.axisLineColor = colors[4]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = UIColor.blackColor()
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[3]
        chartView.leftAxis.gridLineWidth = 0.5
        chartView.leftAxis.gridLineDashLengths = [5.0, 5.0]
        chartView.leftAxis.setLabelCount(11, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[4]
        chartView.leftAxis.customAxisMax = 100
        //        chartView.leftAxis.drawLabelsEnabled = false
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        
        chartView.leftAxis.valueFormatter = numberFormatter
        
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.formSize = 12
        
        let targetLine18 = ChartLimitLine(limit: 18.5, label: "BMI 18.5")
        let targetLine24 = ChartLimitLine(limit: 24.9, label: "BMI 24.9")
        targetLine18.lineDashLengths = [5.0, 5.0]
        targetLine18.lineColor = colors[6]
        targetLine18.lineWidth = 0.5
        targetLine18.valueTextColor = colors[6]
        targetLine18.valueFont = UIFont.systemFontOfSize(10)
        
        targetLine24.lineDashLengths = [5.0, 5.0]
        targetLine24.lineColor = colors[5]
        targetLine24.lineWidth = 0.5
        targetLine24.valueTextColor = colors[5]
        targetLine24.valueFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.addLimitLine(targetLine24)
        chartView.leftAxis.addLimitLine(targetLine18)
        
        
        chartView.gridBackgroundColor = colors[8]
        chartView.notifyDataSetChanged()
        
        //动作
        chartView.setScaleEnabled(false)
        
        
        // add gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 30, y: 10, width: frame.width - 40, height: frame.height - 62)
        
        let color1 = UIColor(red: 255/255, green: 255/255, blue: 250/255, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2).CGColor as CGColorRef
        let color3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0).CGColor as CGColorRef
        let color4 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.5, 0.6, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        chartView.layer.addSublayer(gradientLayer)
        chartView.setScaleEnabled(false)
        
        //动作
        chartView.setScaleEnabled(false)
        return chartView
        
    }
    
    //********************************************************************************************************

    
    /// get blood suger analysis diagram page chart 3
    static public func bloodSugerAnalysisChart3(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        return analysisChart3(frame: frame, normalCount: normalCount, highCount: highCount, lowCount: lowCount)
        
    }
    
    //********************************************************************************************************

    /// get blood suger analysis diagram page chart 2
    static public func bloodSugerAnalysisChart2(frame: CGRect, data: [Double]) ->BarChartView {
        if data.count != 4 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataTextDescription = "data: 4*1 array"
            return tempView
        }
        if data.count == 0 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        
        let colors = [
            UIColor(red: 15/255, green: 227/255, blue: 74/255, alpha: 1),
            UIColor(red: 255/255, green: 143/255, blue: 0/255, alpha: 1),
            UIColor(red: 227/255, green: 57/255, blue: 42/255, alpha: 1),
            UIColor(red: 227/255, green: 57/255, blue: 42/255, alpha: 1),
            //x label color
            UIColor(red: 86/255, green: 86/255, blue: 86/255, alpha: 1)
            
        ]
        
        let dataLabels: [String] = ["空腹", "餐前", "餐后","睡前"]
        let values = data
        
        
        var dataEntries :[BarChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartView = BarChartView(frame: frame)
        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: "")
        
        barChartDataSet.barSpace = 0.65
        barChartDataSet.colors = colors
        barChartDataSet.drawValuesEnabled = true
        barChartDataSet.valueFont = UIFont.boldSystemFontOfSize(16)
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        barChartDataSet.valueFormatter = numberFormatter
        
        
        let barChartData = BarChartData(xVals: dataLabels, dataSet: barChartDataSet)
        chartView.data = barChartData
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = colors[4]
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis.labelTextColor = colors[4]
        chartView.extraBottomOffset = 10
        chartView.extraTopOffset = 15
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        //动作
        chartView.userInteractionEnabled = false
        return chartView
    }
    
    //********************************************************************************************************

    /// get blood suger analysis diagram page chart 1
    static public func bloodSugerAnalysisChart1(frame: CGRect, data: [Double]) ->BarChartView {
        

        if data.count == 0 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        if data.count != 2 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataTextDescription = "data: 2*1 array"
            return tempView
        }
        
        let colors = [UIColor(red: 227/255, green: 57/255, blue: 42/255, alpha: 1),
            UIColor(red: 255/255, green: 143/255, blue: 0/255, alpha: 1),
            //x label color
            UIColor(red: 86/255, green: 86/255, blue: 86/255, alpha: 1)]
        
        let dataLabels: [String] = ["最高值", "最低值"]
        let values = data
        
        
        var dataEntries :[BarChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartView = BarChartView(frame: frame)
        let barChartDataSet = BarChartDataSet(yVals: dataEntries, label: "")

        barChartDataSet.barSpace = 0.65
        barChartDataSet.colors = colors
        barChartDataSet.drawValuesEnabled = true
        barChartDataSet.valueFont = UIFont.boldSystemFontOfSize(16)
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        barChartDataSet.valueFormatter = numberFormatter
            

        let barChartData = BarChartData(xVals: dataLabels, dataSet: barChartDataSet)
        chartView.data = barChartData
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = colors[2]
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        
        chartView.xAxis.labelTextColor = colors[2]
        chartView.extraBottomOffset = 10
        chartView.extraTopOffset = 15
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        //动作
        chartView.userInteractionEnabled = false
        return chartView
    }
    
    //********************************************************************************************************
    
    ///get blood suger Monitor chart2
    static public func bloodSugerMonitorChart2(frame: CGRect, data: [Double], labels: [String]) ->UIView {
        
        
        let myView = UIView(frame: frame)
        if data.count == 0 || labels.count == 0 {
            let tempView = LineChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
            
        }
        
        
        let colors = [
            //折线颜色 0
            UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1),
            //value > 7.8 circle color 1
            UIColor(red: 233/255, green: 112/255, blue: 102/255, alpha: 1),
            // 3.9 < value < 7.8 circle color 2
            UIColor(red: 101/255, green: 232/255, blue: 133/255, alpha: 1),
            // value < 3.9 colors 3
            UIColor(red: 251/255, green: 139/255, blue: 99/255, alpha: 0.8),
            // x label color 4
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            //y label color 5
            
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            // transparent color 6
            UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 0),
            // target line 3.9 color 7
            UIColor(red: 97/255, green: 154/255, blue: 228/255, alpha: 1.0),
            // target line  6.1 color 8
            UIColor(red: 226/255, green: 106/255, blue: 92/255, alpha: 1.0),
            // target line 7.8 color 9
            UIColor(red: 253/255, green: 134/255, blue: 91/255, alpha: 1.0)
        ]
        
        
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        
        let values = data
        var xValues: [Int] = []
        for i in 0..<values.count{
            xValues.append(2 * i + 1)
        }
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: xValues[i])
            dataEntries.append(dataEntry)
            
        }
        var circleColors: [UIColor] = []
        for value in values {
            if value > 7.8 {
                circleColors.append(colors[1])
            }
            else if value > 3.9{
                circleColors.append(colors[2])
            }
            else{
                circleColors.append(colors[3])
            }
        }
        
        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "")
        lineChartDataSet.colors = [colors[0]]
        lineChartDataSet.drawCircleHoleEnabled = true
        lineChartDataSet.circleColors = circleColors
        lineChartDataSet.circleRadius = 4
        //            lineChartDataSets[i].drawCubicEnabled = false
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.lineWidth = 1
        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[4]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.customAxisMin = 3
        chartView.leftAxis.customAxisMax = 15
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 1
        chartView.leftAxis.setLabelCount(7, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[5]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //target line
        let targetLine39 = ChartLimitLine(limit: 3.9, label: "3.9")
        let targetLine61 = ChartLimitLine(limit: 6.1, label: "6.1")
        let targetLine78 = ChartLimitLine(limit: 7.8, label: "7.8")
        targetLine39.lineDashLengths = [3.0, 3.0]
        targetLine39.lineColor = colors[7]
        targetLine39.lineWidth = 0.5
        targetLine39.valueTextColor = colors[7]
        
        targetLine61.lineDashLengths = [3.0, 3.0]
        targetLine61.lineColor = colors[8]
        targetLine61.lineWidth = 0.5
        targetLine61.valueTextColor = colors[8]
        
        targetLine78.lineDashLengths = [3.0, 3.0]
        targetLine78.lineColor = colors[9]
        targetLine78.lineWidth = 0.5
        targetLine78.valueTextColor = colors[9]
        
        chartView.leftAxis.addLimitLine(targetLine39)
        chartView.leftAxis.addLimitLine(targetLine61)
        chartView.leftAxis.addLimitLine(targetLine78)
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[6]
//        chartView.gridBackgroundColor = UIColor.brownColor()
        chartView.gridBackgroundColor = colors[6]
        // legent
        chartView.legend.enabled = false
        
        //动作
        chartView.setScaleEnabled(false)
        chartView.notifyDataSetChanged()
        
        addBloodSugerMonitorBG(myView, contentFrame: chartView.contentRect)
        myView.addSubview(chartView)
        return myView
        
    }
    
    //********************************************************************************************************

    ///get blood suger Monitor chart1
    static public func bloodSugerMonitorChart1(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        
        let chartView = PieChartView(frame: frame)
        let colors = [UIColor(red: 15/255, green: 221/255, blue: 74/255, alpha: 1),
            UIColor(red: 253/255, green: 99/255, blue: 28/255, alpha: 1),
            UIColor(red: 255/255, green: 57/255, blue: 43/255, alpha: 1)]
        
        let dataLabels: [String] = ["正常", "偏低", "偏高"]
        
        
        
        var dataEntries :[ChartDataEntry] = []
        let totalCount = normalCount + highCount + lowCount
        
        
        dataEntries.append(ChartDataEntry(value: Double(lowCount)/Double(totalCount), xIndex: 1))
        dataEntries.append(ChartDataEntry(value: Double(normalCount)/Double(totalCount), xIndex: 0))
        dataEntries.append(ChartDataEntry(value: Double(highCount)/Double(totalCount), xIndex: 2))
        
        //数据设置
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries ,label: "")
        let pieChartData = PieChartData(xVals: dataLabels, dataSet: pieChartDataSet)
        pieChartDataSet.colors = colors
        //设置扇形区域字体
        pieChartDataSet.drawValuesEnabled = false
        
        chartView.data = pieChartData
        
        //动画设置
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)

        //中心区域比例
        chartView.holeRadiusPercent = 0.6
        //        //中心带边框比例
        chartView.transparentCircleRadiusPercent = 0.65
        chartView.descriptionText = ""
//        chartView.legend.enabled = false
        chartView.drawSliceTextEnabled = false
        chartView.legend.position = ChartLegend.ChartLegendPosition.RightOfChart

        chartView.legend.font = UIFont.systemFontOfSize(10)
        chartView.legend.formSize = 10
        
        chartView.userInteractionEnabled = false
//        chartView.backgroundColor = UIColor.brownColor()

        
        return chartView
        
    }
    
    //********************************************************************************************************
    
    ///get blood suger curve page analysis charts
    static public func bloodSugerAnalysis(frame: CGRect, data: [Double], labels: [String]) ->LineChartView {
        if data.count == 0 || labels.count == 0 {
            let tempView = LineChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        
        let colors = [UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 31/255, green: 220/255, blue: 89/255, alpha: 0.9),
            UIColor(red: 100/255, green: 200/255, blue: 210/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1),
            UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        let dataLabels: [String] = labels
        
        let values = data
        
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<values.count{
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            
            dataEntries.append(dataEntry)
            
        }
        //value circle colors
        
        var circleColors: [UIColor] = []
        for i in 0..<values.count{
            if (values[i] > 6.1){
                circleColors.append(colors[0])
            }
            else {
                circleColors.append(colors[1])
            }
        }
        
        
        let chartView = LineChartView(frame: frame)
        let lineChartDataSet: LineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "血糖")
        
        lineChartDataSet.colors = [colors[2]]
        
        lineChartDataSet.drawCircleHoleEnabled = true
        lineChartDataSet.circleColors = circleColors
        lineChartDataSet.circleRadius = 5
        //            lineChartDataSet.drawCubicEnabled = true
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.drawFilledEnabled = true
        lineChartDataSet.fillColor = colors[2]
        lineChartDataSet.fillAlpha = 0.7
        
        lineChartDataSet.lineWidth = 1
        
        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSet: lineChartDataSet)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineWidth = 0.2
        chartView.xAxis.gridLineDashLengths = [8.0, 3.0]
        chartView.xAxis.gridColor = colors[4]
        chartView.xAxis.axisLineColor = colors[3]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[5]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[4]
        chartView.leftAxis.gridLineWidth = 0.2
        //        chartView.leftAxis.gridLineDashLengths = [5.0, 5.0]
        //        chartView.leftAxis.setLabelCount(11, force: false)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[3]
        chartView.leftAxis.customAxisMax = 15
        //        chartView.leftAxis.drawLabelsEnabled = false
        
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.enabled = false
        
        let targetLine39 = ChartLimitLine(limit: 3.9, label: "空腹低血糖")
        let targetLine61 = ChartLimitLine(limit: 6.1, label: "空腹高血糖")
        let targetLine78 = ChartLimitLine(limit: 7.8, label: "餐后高血糖")
        targetLine39.lineDashLengths = [5.0, 3.0]
        targetLine39.lineColor = UIColor(red: 40/255, green: 125/255, blue: 226/255, alpha: 1)
        targetLine39.lineWidth = 0.5
        targetLine39.valueTextColor = UIColor(red: 40/255, green: 125/255, blue: 226/255, alpha: 1)
        targetLine39.valueFont = UIFont.systemFontOfSize(10)
        
        targetLine61.lineDashLengths = [5.0, 3.0]
        targetLine61.lineColor = UIColor(red: 253/255, green: 28/255, blue: 29/255, alpha: 1)
        targetLine61.lineWidth = 0.5
        targetLine61.valueTextColor = UIColor(red: 253/255, green: 28/255, blue: 29/255, alpha: 1)
        targetLine61.valueFont = UIFont.systemFontOfSize(10)
        
        targetLine78.lineDashLengths = [5.0, 3.0]
        targetLine78.lineColor = UIColor(red: 253/255, green: 154/255, blue: 82/255, alpha: 1)
        targetLine78.lineWidth = 0.5
        targetLine78.valueTextColor = UIColor(red: 253/255, green: 154/255, blue: 82/255, alpha: 1)
        targetLine78.valueFont = UIFont.systemFontOfSize(10)
        
        chartView.leftAxis.addLimitLine(targetLine78)
        chartView.leftAxis.addLimitLine(targetLine61)
        chartView.leftAxis.addLimitLine(targetLine39)
        
        
        chartView.gridBackgroundColor = colors[7]
        chartView.backgroundColor = colors[7]
        chartView.notifyDataSetChanged()
        //动作
        chartView.setScaleEnabled(false)
        
        // add gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 40, y: 10, width: frame.width - 50, height: frame.height - 40)
        
        let color1 = UIColor(red: 255/255, green: 255/255, blue: 250/255, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.05).CGColor as CGColorRef
        let color3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.15).CGColor as CGColorRef
        let color4 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        chartView.layer.addSublayer(gradientLayer)
        
        return chartView
    }
    
    //********************************************************************************************************

    
    /// get blood pressure analysis diagram page chart 3
    static public func bloodPressureAnalysisChart3(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        return analysisChart3(frame: frame, normalCount: normalCount, highCount: highCount, lowCount: lowCount)
        
    }
    
    //********************************************************************************************************
    
    /// get blood pressure analysis diagram page chart 1
    static public func bloodPressureAnalysisChart1(frame: CGRect, data: [[Double]]) ->BarChartView{
        if data.count == 0 || data[0].count == 0 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        let colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 154/255, green: 108/255, blue: 176/255, alpha: 1)]
        
        let dataLabels: [String] = ["最高值", "最低值"]
        let values = data
        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: 3, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
//        print(dataEntries)
        
        let chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.15

            barChartDataSets[i].colors = [colors[i]]
            barChartDataSets[i].drawValuesEnabled = false
            
        }
        let barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 3
        chartView.data = barChartData
        
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
//        chartView.xAxis.enabled = false
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = UIColor.blackColor()
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        
        chartView.xAxis.labelTextColor = UIColor.blackColor()
        chartView.extraBottomOffset = 10
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        //动作
        chartView.userInteractionEnabled = false
        return chartView
        
    }
    
    //********************************************************************************************************

    /// get blood pressure analysis diagram page chart 2
    static public func bloodPressureAnalysisChart2(frame: CGRect, data: [[Double]]) ->BarChartView{
        
        if data.count == 0 || data[0].count == 0 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return tempView
        }
        
        let colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 154/255, green: 108/255, blue: 176/255, alpha: 1)]
        
        let dataLabels: [String] = ["早上", "晚上", "其他"]
        let values = data
        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: 3, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
        //        print(dataEntries)
        
        let chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.15
            
            barChartDataSets[i].colors = [colors[i]]
            barChartDataSets[i].drawValuesEnabled = false
            
        }
        let barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 3
        chartView.data = barChartData
        //        chartView.xAxis.enabled = false
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.axisLineColor = UIColor.blackColor()
        chartView.xAxis.labelFont = UIFont.systemFontOfSize(14)
        
        chartView.xAxis.labelTextColor = UIColor.blackColor()
        chartView.extraBottomOffset = 10
        
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.backgroundColor = UIColor.whiteColor()
        chartView.legend.enabled = false
        chartView.descriptionText = ""
        chartView.setScaleEnabled(false)
        //动作
        chartView.userInteractionEnabled = false
        return chartView
        
    }
   

    //********************************************************************************************************
    
    ///get blood pressure analysis curve page charts
    static public func bloodPressureAnalysis(frame: CGRect, data: [[Double]], labels: [String]) ->LineChartView{
     
        if labels.count == 0 || data.count == 0 || data[0].count == 0 {
            let tempView = LineChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return  tempView
        }
        if data.count != 3{
            
            let tempView = LineChartView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            tempView.noDataTextDescription = "error data need 3* labels.count Array"
            return tempView
        }
        
        let colors = [UIColor(red: 61/255, green: 180/255, blue: 195/255, alpha: 1),
            UIColor(red: 239/255, green: 192/255, blue: 58/255, alpha: 1),
            UIColor(red: 151/255, green: 107/255, blue: 177/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 224/255, green: 55/255, blue: 43/255, alpha: 1),
            UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        let dataLabels: [String] = labels

        let values = data
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: j)
                entries.append(dataEntry)
            }
            
            dataEntries.append(entries)
            
        }
        //value circle colors
        
        var circleColors: [ [UIColor] ] = []
        for i in 0..<values.count{
            var circleColorsSub: [UIColor] = []
            for j in 0..<values[i].count{
                if ( (i == 0 && values[i][j] > 140) || (i == 1 && values[i][j] > 90) ){
                    circleColorsSub.append(colors[6])
                }
                else {
                    circleColorsSub.append(colors[i])
                }
                
            }
            circleColors.append(circleColorsSub)
        }
        
        
        
        let chartView = LineChartView(frame: frame)
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "收缩压   "))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "舒张压   "))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[2], label: "心率   "))
        
        
        
//        print(circleColors.count)

        for i in 0..<lineChartDataSets.count{
            
            lineChartDataSets[i].colors = [colors[i]]
            
            lineChartDataSets[i].drawCircleHoleEnabled = true
            lineChartDataSets[i].circleColors = circleColors[i]
            lineChartDataSets[i].circleRadius = 5
//            lineChartDataSets[i].drawCubicEnabled = true
            lineChartDataSets[i].drawValuesEnabled = false
            lineChartDataSets[i].drawFilledEnabled = true
            lineChartDataSets[i].fillColor = colors[i]
            lineChartDataSets[i].fillAlpha = 0.2
            
            lineChartDataSets[i].lineWidth = 1
        }
        
        
        //设置data
        
        let lineChartData = LineChartData(xVals: dataLabels, dataSets: lineChartDataSets)
        chartView.data = lineChartData
        
        //设置动画
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        chartView.xAxis.labelPosition = .Bottom
        chartView.xAxis.drawGridLinesEnabled = true
        chartView.xAxis.gridLineWidth = 0.5
//        chartView.xAxis.gridLineDashLengths = [3.0, 3.0]
        chartView.xAxis.gridColor = colors[3]
        chartView.xAxis.axisLineColor = colors[4]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = UIColor.blackColor()
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.labelFont = UIFont.boldSystemFontOfSize(12)
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridColor = colors[3]
        chartView.leftAxis.gridLineWidth = 0.5
        chartView.leftAxis.gridLineDashLengths = [5.0, 5.0]
        chartView.leftAxis.setLabelCount(11, force: false)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[4]
        chartView.leftAxis.customAxisMax = 220
        //        chartView.leftAxis.drawLabelsEnabled = false       
        
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.formSize = 12
        
        
        //target line
        let targetLine90 = ChartLimitLine(limit: 90, label: "舒张压")
        let targetLine140 = ChartLimitLine(limit: 140, label: "收缩压")
        targetLine90.lineDashLengths = [5.0, 5.0]
        targetLine90.lineColor = colors[5]
        targetLine90.lineWidth = 0.5
        targetLine90.valueTextColor = colors[5]
        targetLine90.valueFont = UIFont.systemFontOfSize(10)
        
        targetLine140.lineDashLengths = [5.0, 5.0]
        targetLine140.lineColor = colors[5]
        targetLine140.lineWidth = 0.5
        targetLine140.valueTextColor = colors[5]
        targetLine140.valueFont = UIFont.systemFontOfSize(10)
        chartView.leftAxis.addLimitLine(targetLine140)
        chartView.leftAxis.addLimitLine(targetLine90)
        
        
        chartView.gridBackgroundColor = colors[7]
        chartView.notifyDataSetChanged()
        
        //动作
        chartView.setScaleEnabled(false)
        
        // add gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 40, y: 10, width: frame.width - 50, height: frame.height - 62)
        
        let color1 = UIColor(red: 250/255, green: 255/255, blue: 250/255, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.05).CGColor as CGColorRef
        let color3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.10).CGColor as CGColorRef
        let color4 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.25).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        chartView.layer.addSublayer(gradientLayer)
        

        return chartView

    }
    
    
    //********************************************************************************************************
    
    ///get home page chart
    static public func homePageView1(frame: CGRect, data: [Double]) ->LineChartView{
        
        let dataLabels = [" 0:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00",
            "23:00", "24:00"]
        if data.count == 0{
            let tempView = LineChartView(frame: frame)
            tempView.noDataText = "没有数据 "
            return tempView
        }
        
        if (dataLabels.count > data.count){
            let tempView = LineChartView(frame: frame)
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
        let chartView = LineChartView(frame: frame)
        
        
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
        let numberFormatter = NSNumberFormatter()
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
        chartView.notifyDataSetChanged()
        
        //动作
        chartView.setScaleEnabled(false)
        
        // add gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 25, y: 10, width: frame.width - 35, height: frame.height - 38)
        
        let color1 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.2).CGColor as CGColorRef
        let color4 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        chartView.layer.addSublayer(gradientLayer)
        
        return chartView
    }
    
    
    //********************************************************************************************************
    
    /// get blood Presure Monitor Chart
    static public func bloodPressureMonitor(frame: CGRect, data: [[Double]], labels: [String]) ->UIView{
        let myView = UIView(frame: frame)
        if labels.count == 0 || data.count == 0 || data[0].count == 0 {
            let tempView = BarChartView(frame: frame)
            tempView.noDataText = "没有数据"
            return  tempView
        }
        if data.count != 3{
            
            let tempView = LineChartView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
            tempView.noDataTextDescription = "error data need 3* labels.count Array"
            myView.addSubview(tempView)
            return myView
        }
        
        let colors = [UIColor(red: 61/255, green: 180/255, blue: 195/255, alpha: 1),
            UIColor(red: 243/255, green: 153/255, blue: 34/255, alpha: 1),
            UIColor(red: 154/255, green: 108/255, blue: 176/255, alpha: 1),
            UIColor(red: 30/255, green: 250/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 250/255, green: 30/255, blue: 30/255, alpha: 0.8),
            UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1),
            UIColor(red: 244/255, green: 170/255, blue: 103/255, alpha: 1),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = []
        for item in labels{
            dataLabels.append("")
            dataLabels.append(item)
        }
        dataLabels.append("")
        let values = data
        
        var xValues: [[Int]] = []
        for i in 0..<values.count{
            var tempXValues: [Int] = []
            for j in 0..<values[i].count{
                tempXValues.append(2 * j + 1)
            }
            xValues.append(tempXValues)
        }
        
        
        
        var dataEntries: [ [ChartDataEntry] ] = []
        for i in 0..<values.count{
            var entries: [ChartDataEntry] = []
            for j in 0..<values[i].count{
                let dataEntry = ChartDataEntry(value: values[i][j], xIndex: xValues[i][j])
                entries.append(dataEntry)
            }
            dataEntries.append(entries)
            
        }

        let chartView = LineChartView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))
        
        var lineChartDataSets: [LineChartDataSet] = []
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[0], label: "收缩压"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[1], label: "舒张压"))
        lineChartDataSets.append(LineChartDataSet(yVals: dataEntries[2], label: "心率"))
        
        
        for i in 0..<lineChartDataSets.count{
            lineChartDataSets[i].colors = [colors[i]]
            lineChartDataSets[i].drawCircleHoleEnabled = false
            lineChartDataSets[i].circleColors = [colors[i]]
            lineChartDataSets[i].circleRadius = 3.5
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
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.xAxis.axisLineColor = colors[1]
        chartView.xAxis.axisLineWidth = 1
        chartView.xAxis.labelTextColor = colors[5]
        chartView.xAxis.spaceBetweenLabels = 1
        chartView.xAxis.avoidFirstLastClippingEnabled = true
        chartView.xAxis.setLabelsToSkip(0)
        chartView.xAxis
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.startAtZeroEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.leftAxis.customAxisMin = 40
        chartView.leftAxis.customAxisMax = 220
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 1
        chartView.leftAxis.setLabelCount(7, force: true)
        chartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        chartView.leftAxis.labelTextColor = colors[6]
        //  chartView.leftAxis.drawLabelsEnabled = false
        
        //value格式化
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //target line
        let targetLine90 = ChartLimitLine(limit: 90, label: "90")
        let targetLine140 = ChartLimitLine(limit: 140, label: "140")
        targetLine90.lineDashLengths = [3.0, 3.0]
        targetLine90.lineColor = colors[3]
        targetLine90.lineWidth = 0.5
        targetLine90.valueTextColor = colors[6]
        targetLine140.lineDashLengths = [3.0, 3.0]
        targetLine140.lineColor = colors[4]
        targetLine140.lineWidth = 0.5
        targetLine140.valueTextColor = colors[4]

        chartView.leftAxis.addLimitLine(targetLine90)
        chartView.leftAxis.addLimitLine(targetLine140)
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.position = ChartLegend.ChartLegendPosition.BelowChartLeft
        
        //background
        chartView.backgroundColor = colors[7]
//        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.gridBackgroundColor = colors[7]
        
        //动作
        chartView.setScaleEnabled(false)
        
        chartView.notifyDataSetChanged()
        addBloodPressureMonitorBG(myView, contentFrame:chartView.contentRect)
        myView.addSubview(chartView)
    
        return myView
        
    }
    
    
    
    static private func addBloodPressureMonitorBG(targetView: UIView, contentFrame: CGRect) {
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        let layer1Hight = (220.0 - 140.0) / (220.0 - 40.0) * totalHight
        let layer2Hight = (140.0 - 90.0) / (220.0 - 40.0)  * totalHight
        let layer3Hight = (90.0 - 40.0) / (220.0 - 40.0) * totalHight
        
        let bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y, width: contentFrame.width, height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer1)
        let bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight, width: contentFrame.width, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 254/255, green: 245/255, blue: 233/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer2)
        let bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight + layer2Hight, width: contentFrame.width, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer3)
 

        
    }
    
    static private func addBodyFatMonitorBG(targetView: UIView, contentFrame: CGRect) {
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        let layer1Hight = (120.0 - 80.0) / (120.0 - 0.0) * totalHight
        let layer2Hight = (80.0 - 40.0) / (120.0 - 0.0)  * totalHight
        let layer3Hight = (40.0 - 0.0) / (120.0 - 0.0) * totalHight
        
        let bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y, width: contentFrame.width , height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer1)
        let bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight, width: contentFrame.width, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 254/255, green: 245/255, blue: 233/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer2)
        let bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight + layer2Hight, width: contentFrame.width, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer3)
        
    }
    
    static private func addBodyWeightBG(targetView: UIView, contentFrame: CGRect) {
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        let layer1Hight = (100.0 - 80.0) / (100.0 - 10.0) * totalHight
        let layer2Hight = (80.0 - 60.0) / (100.0 - 10.0)  * totalHight
        let layer3Hight = (60.0 - 10.0) / (100.0 - 10.0) * totalHight
        
        let bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y, width: contentFrame.width , height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer1)
        let bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight, width: contentFrame.width, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 254/255, green: 245/255, blue: 233/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer2)
        let bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight + layer2Hight, width: contentFrame.width, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer3)
        
    }
    
    static private func addBodyHeightBG(targetView: UIView, contentFrame: CGRect) {
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        let layer1Hight = (210.0 - 150.0) / (210.0 - 30.0) * totalHight
        let layer2Hight = (150.0 - 90.0) / (210.0 - 30.0)  * totalHight
        let layer3Hight = (90.0 - 30.0) / (210.0 - 30.0) * totalHight
        
        let bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y, width: contentFrame.width , height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer1)
        let bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight, width: contentFrame.width, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 254/255, green: 245/255, blue: 233/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer2)
        let bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight + layer2Hight, width: contentFrame.width, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer3)
        
    }
    
    static private func addBloodSugerMonitorBG(targetView: UIView, contentFrame: CGRect){
        let colors = [ UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1),
            UIColor(red: 230/255, green: 230/255, blue: 220/255, alpha: 1),
            UIColor(red: 230/255, green: 252/255, blue: 245/255, alpha: 1),
            UIColor(red: 255/255, green: 245/255, blue: 233/255, alpha: 1)]
            
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        var layersHight: [CGFloat] = []
        layersHight.append((15.0 - 7.8) / (15.0 - 3.0) * totalHight)
        layersHight.append((7.8 - 6.1) / (15.0 - 3.0)  * totalHight)
        layersHight.append((6.1 - 3.9) / (15.0 - 3.0) * totalHight)
        layersHight.append ((3.9 - 3.0) / (15.0 - 3.0) * totalHight)
        
        var yOffset: CGFloat = 0.0
        for i in 0..<layersHight.count{
            let bgLayer = CALayer()
            
            bgLayer.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + yOffset, width: contentFrame.width, height: layersHight[i])
            bgLayer.backgroundColor = colors[i].CGColor
            targetView.layer.addSublayer(bgLayer)
            yOffset += layersHight[i]
            
        }
        
    }
    
    static private func addTemperatureBG(targetView: UIView, contentFrame: CGRect) {
        
        //设置背景填充图层
        let totalHight = contentFrame.height
        let layer1Hight = (41.5 - 37.0) / (41.5 - 35.5) * totalHight
        let layer2Hight = (37.0 - 36.0) / (41.5 - 35.5)   * totalHight
        let layer3Hight = (36.0 - 35.5) / (41.5 - 35.5)  * totalHight
        
        let bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y, width: contentFrame.width , height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer1)
        let bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight, width: contentFrame.width, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer2)
        let bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: contentFrame.origin.x, y: contentFrame.origin.y + layer1Hight + layer2Hight, width: contentFrame.width, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).CGColor
        targetView.layer.addSublayer(bgLayer3)
        
    }
    
    
    static private func analysisChart3(frame frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        
        let chartView = PieChartView(frame: frame)
        let colors = [
            UIColor(red: 255/255, green: 36/255, blue: 35/255, alpha: 1),
            UIColor(red: 254/255, green: 140/255, blue: 0/255, alpha: 1),
            UIColor(red: 15/255, green: 221/255, blue: 74/255, alpha: 1)
            ]
        
        let dataLabels: [String] = [" ", " ", " "]
        
        
        var dataEntries :[ChartDataEntry] = []
        let totalCount = normalCount + highCount + lowCount
        
        dataEntries.append(ChartDataEntry(value: Double(highCount)/Double(totalCount), xIndex: 0))
        dataEntries.append(ChartDataEntry(value: Double(lowCount)/Double(totalCount), xIndex: 1))
        dataEntries.append(ChartDataEntry(value: Double(normalCount)/Double(totalCount), xIndex: 2))
        
        
        //数据设置
        let pieChartDataSet = PieChartDataSet(yVals: dataEntries ,label: "")
        let pieChartData = PieChartData(xVals: dataLabels, dataSet: pieChartDataSet)
        pieChartDataSet.colors = colors
        //设置扇形区域字体
        pieChartDataSet.drawValuesEnabled = false
        chartView.data = pieChartData
        
        //动画设置
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        //        中心区域文字设置
        //        chartView.centerText = "\(values.count)\n 测量次数"
        //        chartView.centerTextFont = UIFont.systemFontOfSize(14)
        //中心区域比例
        chartView.holeRadiusPercent = 0.8
        //        //中心带边框比例
        //        chartView.transparentCircleRadiusPercent = 0.3
        chartView.descriptionText = ""
        //        chartView.backgroundColor = UIColor.brownColor()
        chartView.legend.enabled = false
        chartView.userInteractionEnabled = false
        
        return chartView
    }

}