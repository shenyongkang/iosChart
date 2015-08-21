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
    
    
    
    ///get blood suger minotor chart1
    static public func bloodSugerAnalysisChart1(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
        
        var chartView = PieChartView(frame: frame)
        let colors = [UIColor(red: 15/255, green: 221/255, blue: 74/255, alpha: 1),
            UIColor(red: 253/255, green: 99/255, blue: 28/255, alpha: 1),
            UIColor(red: 255/255, green: 57/255, blue: 43/255, alpha: 1)]
        
        var dataLabels: [String] = ["正常\n", "偏低 \n", "偏高\n"]
        
        
        
        var dataEntries :[ChartDataEntry] = []
        var totalCount = normalCount + highCount + lowCount
        
        
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
        chartView.legend.formLineWidth = 10
        chartView.legend.font = UIFont.systemFontOfSize(12)
        chartView.userInteractionEnabled = false
        
        return chartView
        
    }
    
    
    /// get blood pressure analysis diagram page chart 3
    static public func bloodPressureAnalysisChart3(frame: CGRect, normalCount: Int, highCount: Int, lowCount: Int) ->PieChartView {
    
        var chartView = PieChartView(frame: frame)
        let colors = [UIColor(red: 15/255, green: 221/255, blue: 74/255, alpha: 0.8),
            UIColor(red: 255/255, green: 36/255, blue: 35/255, alpha: 0.8),
            UIColor(red: 254/255, green: 140/255, blue: 0/255, alpha: 0.8)]
        
        var dataLabels: [String] = [" ", " ", " "]

        
        var dataEntries :[ChartDataEntry] = []
        var totalCount = normalCount + highCount + lowCount

        dataEntries.append(ChartDataEntry(value: Double(highCount)/Double(totalCount), xIndex: 2))
        dataEntries.append(ChartDataEntry(value: Double(lowCount)/Double(totalCount), xIndex: 0))
        dataEntries.append(ChartDataEntry(value: Double(normalCount)/Double(totalCount), xIndex: 1))

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
    
    
    /// get blood pressure analysis diagram page chart 1
    static public func bloodPressureAnalysisChart1(frame: CGRect, data: [[Double]]) ->BarChartView{
        
        let colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 154/255, green: 108/255, blue: 176/255, alpha: 1)]
        
        var dataLabels: [String] = ["最高值", "最低值"]
        let values = data
        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: 3, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
//        print(dataEntries)
        
        var chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.15

            barChartDataSets[i].colors = [colors[i]]
            barChartDataSets[i].drawValuesEnabled = false
            
        }
        var barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 3
        chartView.data = barChartData
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
    
    
    /// get blood pressure analysis diagram page chart 2
    static public func bloodPressureAnalysisChart2(frame: CGRect, data: [[Double]]) ->BarChartView{
        
        let colors = [UIColor(red: 73/255, green: 190/255, blue: 203/255, alpha: 1),
            UIColor(red: 255/255, green: 136/255, blue: 3/255, alpha: 1),
            UIColor(red: 154/255, green: 108/255, blue: 176/255, alpha: 1)]
        
        var dataLabels: [String] = ["早上", "晚上", "其他"]
        let values = data
        
        
        var dataEntries :[[BarChartDataEntry]] = [[BarChartDataEntry]](count: 3, repeatedValue: [])
        for i in 0..<values.count{
            for j in 0..<values[i].count{
                let dataEntry = BarChartDataEntry(value: values[i][j], xIndex: i)
                dataEntries[j].append(dataEntry)
            }
            
        }
        //        print(dataEntries)
        
        var chartView = BarChartView(frame: frame)
        var barChartDataSets: [BarChartDataSet] = []
        for i in 0..<dataEntries.count{
            barChartDataSets.append(BarChartDataSet(yVals: dataEntries[i], label: ""))
            barChartDataSets[i].barSpace = 0.15
            
            barChartDataSets[i].colors = [colors[i]]
            barChartDataSets[i].drawValuesEnabled = false
            
        }
        var barChartData = BarChartData(xVals: dataLabels, dataSets: barChartDataSets)
        barChartData.groupSpace = 3
        chartView.data = barChartData
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
        chartView.setScaleEnabled(false)
        //动作
        chartView.userInteractionEnabled = false
        return chartView
        
    }
   
    //************************************************************************************************************
    /// get body fat analysis charts
    static public func bodyFatAnalysis(frame: CGRect, data: [[Double]], labels: [String]) ->LineChartView{
        
        
        
        let colors = [UIColor(red: 61/255, green: 180/255, blue: 195/255, alpha: 1),
            UIColor(red: 239/255, green: 192/255, blue: 58/255, alpha: 1),
            UIColor(red: 151/255, green: 107/255, blue: 177/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 224/255, green: 55/255, blue: 43/255, alpha: 1),
            UIColor(red: 0/255, green: 0/255, blue: 246/255, alpha: 1),
            UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.8),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = labels
        
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

        
        var chartView = LineChartView(frame: frame)
        
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
        
        var numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0

        chartView.leftAxis.valueFormatter = numberFormatter
        
        
        
        //设置图像description
        chartView.descriptionText = ""
        chartView.legend.formSize = 12
        
        var targetLine18 = ChartLimitLine(limit: 18.5, label: "18.5")
        var targetLine24 = ChartLimitLine(limit: 24, label: "24.99")
        targetLine18.lineDashLengths = [5.0, 5.0]
        targetLine18.lineColor = colors[6]
        targetLine18.lineWidth = 0.5
        targetLine18.valueTextColor = colors[7]
        targetLine18.valueFont = UIFont.systemFontOfSize(10)
        targetLine18.labelPosition = ChartLimitLine.ChartLimitLabelPosition.Left
        
        targetLine24.lineDashLengths = [5.0, 5.0]
        targetLine24.lineColor = colors[5]
        targetLine24.lineWidth = 0.5
        targetLine24.valueTextColor = colors[7]
        targetLine24.valueFont = UIFont.systemFontOfSize(10)
        targetLine24.labelPosition = ChartLimitLine.ChartLimitLabelPosition.Left
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

    
    //************************************************************************************************************
    ///get blood suger analysis charts
    static public func bloodSugerAnalysis(frame: CGRect, data: [Double], labels: [String]) ->LineChartView {
        
        
        let colors = [UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 31/255, green: 220/255, blue: 89/255, alpha: 0.9),
            UIColor(red: 100/255, green: 200/255, blue: 210/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1),
            UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = labels
        
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
        
        
        
        var chartView = LineChartView(frame: frame)
        var lineChartDataSet: LineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "血糖")
            
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
        
        var targetLine39 = ChartLimitLine(limit: 3.9, label: "空腹低血糖")
        var targetLine61 = ChartLimitLine(limit: 6.1, label: "空腹高血糖")
        var targetLine78 = ChartLimitLine(limit: 7.8, label: "餐后高血糖")
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
    
    
    //************************************************************************************************************
    
    ///get blood pressure analysis curve page charts
    static public func bloodPressureAnalysis(frame: CGRect, data: [[Double]], labels: [String]) ->LineChartView{
     
        
        
        let colors = [UIColor(red: 61/255, green: 180/255, blue: 195/255, alpha: 1),
            UIColor(red: 239/255, green: 192/255, blue: 58/255, alpha: 1),
            UIColor(red: 151/255, green: 107/255, blue: 177/255, alpha: 1),
            UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1),
            UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1),
            UIColor(red: 224/255, green: 55/255, blue: 43/255, alpha: 1),
            UIColor(red: 224/255, green: 70/255, blue: 70/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 250/255, alpha: 0)]
        
        
        var dataLabels: [String] = labels

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
        
        
        
        var chartView = LineChartView(frame: frame)
        
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
        var targetLine90 = ChartLimitLine(limit: 90, label: "舒张压")
        var targetLine140 = ChartLimitLine(limit: 140, label: "收缩压")
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
    
    
    //************************************************************************************************************
    
    ///get home page view with (Double type Number, 25 elements)
    static public func homePageView1(frame: CGRect, data: [Double]) ->LineChartView{
        
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
    
    
    //************************************************************************************************************
    /// get blood Presure Monitor Chart with (3 group Double type number ,every gourp with 7 elements),
    static public func bloodPressureMonitor(frame: CGRect, data: [[Double]], labels: [String]) ->LineChartView{
        
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

        var chartView = LineChartView(frame: frame)
        
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
        var numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        chartView.leftAxis.valueFormatter = numberFormatter
        
        //target line
        var targetLine90 = ChartLimitLine(limit: 90, label: "90")
        var targetLine140 = ChartLimitLine(limit: 140, label: "140")
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
        chartView.notifyDataSetChanged()
        //background
        chartView.backgroundColor = colors[7]
//        chartView.gridBackgroundColor = UIColor.whiteColor()
        chartView.gridBackgroundColor = colors[7]
        
        //动作
        chartView.setScaleEnabled(false)
    
        return chartView
        
    }
    
    
    static public func bloodPressureMonitorBG(frame: CGRect) ->UIView {
        var bgView = UIView(frame: frame)
        
        //设置背景填充图层
        let totalHight = frame.height - 58
        let layer1Hight = (220.0 - 140.0) / (220.0 - 40.0) * totalHight
        let layer2Hight = (140.0 - 90.0) / (220.0 - 40.0)  * totalHight
        let layer3Hight = (90.0 - 40.0) / (220.0 - 40.0) * totalHight
        
        var bgLayer1 = CALayer()
        bgLayer1.frame = CGRect(x: 30, y: 10, width: frame.width - 40, height: layer1Hight)
        bgLayer1.backgroundColor = UIColor(red: 255/255, green: 236/255, blue: 235/255, alpha: 1).CGColor
        bgView.layer.addSublayer(bgLayer1)
        var bgLayer2 = CALayer()
        bgLayer2.frame = CGRect(x: 30, y: 10 + layer1Hight, width: frame.width - 40, height: layer2Hight)
        bgLayer2.backgroundColor = UIColor(red: 254/255, green: 245/255, blue: 233/255, alpha: 1).CGColor
        bgView.layer.addSublayer(bgLayer2)
        var bgLayer3 = CALayer()
        bgLayer3.frame = CGRect(x: 30, y: 10 + layer1Hight + layer2Hight, width: frame.width - 40, height: layer3Hight)
        bgLayer3.backgroundColor = UIColor(red: 230/255, green: 252/255, blue: 237/255, alpha: 1).CGColor
        bgView.layer.addSublayer(bgLayer3)
        return bgView
        
    }
    
}