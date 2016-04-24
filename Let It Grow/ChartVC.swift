//
//  DetailVC.swift
//  Let It Grow
//
//  Created by shengxiang guo on 4/12/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//
import UIKit
import Charts


class ChartVC: UIViewController, ChartViewDelegate {
    var months = [String]()
    var reading = [Double]()
    
    @IBOutlet weak var barChartView: BarChartView!
    
    var dic:Dictionary<String,AnyObject> = [:]
    var itemName:String!
    var plant:Plant!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        barChartView.delegate = self
        for (key,value) in dic{
            //print("\(key)")
            //print("\(value)")
            itemName = key
            plant = value as! Plant
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        for time in plant.date[1].time{
            print(time.data["ROOM_HUMIDITY"])
            months.append(time.time)
            reading.append(time.data["ROOM_HUMIDITY"] as! Double)
        }
        
        
        //months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        //let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        barChartView.noDataTextDescription = "GIVE REASON"

        setChart(months, values: reading)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "Unit")
        let chartData = BarChartData(xVals: months, dataSet: chartDataSet)
        barChartView.data = chartData
        barChartView.descriptionText = itemName
        //chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        chartDataSet.colors = ChartColorTemplates.joyful()
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.backgroundColor = UIColor(red: 247/255, green: 255/255, blue: 227/255, alpha: 1)
        
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
        let ll = ChartLimitLine(limit: 50.0, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
    }
    
    
    func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
        //print("\(entry.value) in \(months[entry.xIndex])")
    }
    
    @IBAction func saveChart(sender: UIBarButtonItem) {
        barChartView.saveToCameraRoll()
    }
    
    
}

