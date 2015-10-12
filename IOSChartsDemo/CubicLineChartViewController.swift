//
//  CubicLineChartViewController.swift
//  iOSChartsDemo
//
//  Created by 沈永康 on 15/8/7.
//  Copyright (c) 2015年 Appcoda. All rights reserved.
//

import UIKit
import Charts

class CubicLineChartViewController: UIViewController {


    @IBOutlet weak var cubicLineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let months =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [21.0, 14.0, 16.0, 13.0, 12.0, 16.0, 14.0, 18.0, 12.0, 14.0, 15.0, 14.0]
        
        setChart(months, values: unitsSold)
        setImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setImage()
    {
        let image = UIImage(named: "background2")

        let backgroundImage = UIImageView(image: image)
        backgroundImage.contentMode = UIViewContentMode.ScaleToFill
        
        backgroundImage.alpha = 0.5
        backgroundImage.frame = CGRect(x: 35, y: 364, width: view.frame.width - 45, height: view.frame.height - 364 - cubicLineChartView.xAxis.labelHeight * 2.0)
        
        view.addSubview(backgroundImage)
//        print(cubicLineChartView.frame)
//        print("\n")
//        print(cubicLineChartView.frame )
//        print("\n")
//        print(backgroundImage.frame)
//        print("\n")
//        print(cubicLineChartView.xAxis.labelHeight * 2.0 )
        
     
        
        
    }
    func setChart(dataPoints: [String], values: [Double]){
        
        let colors = [UIColor(red: 60/255, green: 222/255, blue: 229/255, alpha: 0.9),
            UIColor(red: 70/255, green: 237/255, blue: 167/255, alpha: 0.9),
            UIColor(red: 70/255, green: 177/255, blue: 235/255, alpha: 0.9),
            UIColor(red: 195/255, green: 179/255, blue: 227/255, alpha: 0.9),
            UIColor(red: 220/255, green: 250/255, blue: 100/255, alpha: 0.9),
            UIColor(red: 214/255, green: 130/255, blue: 182/255, alpha: 0.9)]
        
        var dataEntries1: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry1 = ChartDataEntry(value: values[i], xIndex: i)
            let dataEntry2 = ChartDataEntry(value: values[i] * 0.8, xIndex: i)
            dataEntries1.append(dataEntry1)
            dataEntries2.append(dataEntry2)
        }
        
        
        
        let lineChartDataSet1 = LineChartDataSet(yVals: dataEntries1, label: "data 1")
        let lineChartDataSet2 = LineChartDataSet(yVals: dataEntries2, label: "data 2")
        
        
        
        
        //        lineChartDataSet1.colors = colors
        
        //在dataset里设置线的颜色
        lineChartDataSet1.colors = [colors[3]]
        lineChartDataSet2.colors = [colors[0]]
        
        //折线节点圆圈设置
            //不显示圆圈
//        lineChartDataSet1.drawCircleHoleEnabled = false
//        lineChartDataSet1.circleRadius = 0
//        lineChartDataSet2.drawCircleHoleEnabled = false
//        lineChartDataSet2.circleRadius = 0
            //显示圆圈
        
        //折线节点圆圈设置
        lineChartDataSet1.drawCircleHoleEnabled = true
        lineChartDataSet1.circleColors = [colors[3]]
        lineChartDataSet1.circleRadius = 5
//        lineChartDataSet1.drawCubicEnabled = true
        
        lineChartDataSet2.drawCircleHoleEnabled = true
        lineChartDataSet2.circleColors = [colors[0]]
        lineChartDataSet2.circleRadius = 5
        
        //value设置
        lineChartDataSet1.drawValuesEnabled = false
        lineChartDataSet2.drawValuesEnabled = false

        //线宽设置
        lineChartDataSet1.lineWidth = 1
        
        
        //设置填充、填充颜色
        lineChartDataSet1.drawFilledEnabled = true
        lineChartDataSet1.fillColor = colors[3]
        lineChartDataSet1.fillAlpha = 0.5
        lineChartDataSet2.drawFilledEnabled = true
        lineChartDataSet2.fillColor = colors[0]
        lineChartDataSet2.fillAlpha = 0.5
        
        
        
        
        //设置data
        let lineChartDataSet = [lineChartDataSet1, lineChartDataSet2]
        let lineChartData = LineChartData(xVals: dataPoints, dataSets: lineChartDataSet)
        cubicLineChartView.data = lineChartData
        
        //设置动画
        cubicLineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .Linear)
        
        //设置X Y 轴及网格参数
        
        
        cubicLineChartView.xAxis.labelPosition = .Bottom
        cubicLineChartView.xAxis.drawGridLinesEnabled = false
        cubicLineChartView.xAxis.axisLineColor = colors[1]
        cubicLineChartView.xAxis.axisLineWidth = 0
        cubicLineChartView.xAxis.labelTextColor = colors[2]
        cubicLineChartView.xAxis.spaceBetweenLabels = 1
        
        cubicLineChartView.rightAxis.enabled = false
        cubicLineChartView.leftAxis.drawAxisLineEnabled = false
        cubicLineChartView.leftAxis.gridColor = colors[1]
        cubicLineChartView.leftAxis.gridLineWidth = 0.5
        cubicLineChartView.leftAxis.setLabelCount(8, force: false)
        cubicLineChartView.leftAxis.labelFont = UIFont.systemFontOfSize(12)
        cubicLineChartView.leftAxis.labelTextColor = colors[2]
//        cubicLineChartView.leftAxis.drawLabelsEnabled = false
        
        
       
        
        //设置图像description
        cubicLineChartView.descriptionText = ""
        cubicLineChartView.legend.enabled = false
        //target line
        let limitLine = ChartLimitLine(limit: 16.0, label: "Target")
        limitLine.lineColor = UIColor(red: 220/255, green: 37/255, blue: 167/255, alpha: 0.5)
        cubicLineChartView.rightAxis.addLimitLine(limitLine)
        
        //图像背景
//        cubicLineChartView.backgroundColor = UIColor.brownColor()

//        cubicLineChartView.gridBackgroundColor = UIColor.brownColor()
    
          
        
        
        
        
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
