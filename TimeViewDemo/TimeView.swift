//
//  TimeView.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 27.02.2018.
//

import UIKit

@IBDesignable class TimeView: UIView {
    
    @IBInspectable var startingTime: CGFloat = 7.0 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var endingTime: CGFloat = 19.0 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    // Period of time in minutes.
    @IBInspectable var timePeriod: CGFloat = 15 {
        didSet {
            updateView()
            setNeedsDisplay()
        }
    }
    
    var bars: [TimeBar] = []
    
    private var barAmount: Int = 0
    private var hourSection: Int = 4
    
    func updateView() {
        bars.removeAll()
        barAmount = calculateBarAmount()
        hourSection = Int(60 / timePeriod)
        
        let bar = TimeBar()//(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width / CGFloat(barAmount), height: self.frame.height))
        bar.isAvailable = true
        bars.append(bar)
        
        let bar2 = TimeBar()//(frame: CGRect(x: bar.frame.maxX, y: self.frame.minY, width: self.frame.width / CGFloat(barAmount), height: self.frame.height))
        bar2.isAvailable = false
        bars.append(bar2)
        
        let bar3 = TimeBar()//(frame: CGRect(x: bar2.frame.maxX, y: self.frame.minY, width: self.frame.width / CGFloat(barAmount), height: self.frame.height))
        bar3.isAvailable = false
        bars.append(bar3)
        
        //        bars = createDemoData()
        
        self.subviews.forEach { $0.removeFromSuperview() }
        let sv = UIStackView(arrangedSubviews: bars)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.frame = self.frame
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.isUserInteractionEnabled = true
        
    }
    
//    override func draw(_ rect: CGRect) {
//        barAmount = calculateBarAmount()
//        hourSection = Int(60 / timePeriod)
//
//        let bar = TimeBar(frame: CGRect(x: rect.minX, y: rect.minY, width: rect.width / CGFloat(2), height: rect.height))
//        bar.isAvailable = true
//        bars.append(bar)
//
//        let bar2 = TimeBar(frame: CGRect(x: rect.minX + rect.width / CGFloat(2), y: rect.minY, width: rect.width / CGFloat(2), height: rect.height))
//        bar2.isAvailable = false
//        bars.append(bar2)
//
////        bars = createDemoData()
//
//        self.subviews.forEach { $0.removeFromSuperview() }
//        let sv = UIStackView(arrangedSubviews: bars)
//        sv.axis = .horizontal
//        sv.alignment = .fill
//        sv.distribution = .fillEqually
//        addSubview(sv)
//        sv.translatesAutoresizingMaskIntoConstraints = false
//        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//    }
    
    private func calculateBarAmount() -> Int {
        guard startingTime < endingTime else { return 1 }
        
        return Int((60 * (endingTime - startingTime)) / timePeriod)
    }

    func createDemoData() -> [TimeBar] {
        var bars = [TimeBar]()
        
        let bar = TimeBar()
        bar.isAvailable = true
        bars.append(bar)
        
        let bar2 = TimeBar()
        bar2.isAvailable = false
        bars.append(bar2)
            
        return bars
    }
}
