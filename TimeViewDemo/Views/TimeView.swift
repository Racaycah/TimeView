//
//  TimeView.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 27.02.2018.
//

import UIKit

@IBDesignable class TimeView: UIView {
    
    @IBInspectable var startingTime: Float = 7.0 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var endingTime: Float = 19.0 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    // Period of time in minutes.
    @IBInspectable var timePeriod: Float = 15 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    var bars: [TimeBar] = []
    
    private var barAmount: Int = 0
    var hourSection: Int = 4
    
    func updateView() {
        bars.removeAll()
        barAmount = calculateBarAmount()
        hourSection = Int(60 / timePeriod)
        
        bars = createDemoData()

    }

    
    private func calculateBarAmount() -> Int {
        guard startingTime < endingTime else { return 1 }
        
        return Int((60 * (endingTime - startingTime)) / timePeriod)
    }

    func createDemoData() -> [TimeBar] {
        var bars = [TimeBar]()
        
        for i in 0..<barAmount {
            let bar = TimeBar()
            bar.isAvailable = randomBool()
            bar.hourValue = startingTime + (Float(i) * timePeriod / 100)// To be translated into Time measurement.
            print(bar.hourValue)
            bars.append(bar)
        }
            
        return bars
    }
}

// MARK: - Utility
public func randomBool() -> Bool {
    return arc4random_uniform(2) == 0 ? true : false
}
