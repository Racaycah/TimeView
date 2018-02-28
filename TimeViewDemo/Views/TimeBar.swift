//
//  TimeBar.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 27.02.2018.
//

import UIKit

@IBDesignable class TimeBar: UIView, UIGestureRecognizerDelegate {
    
    @IBInspectable var isAvailable: Bool = true {
        didSet {
            self.backgroundColor = isAvailable ? UIColor.green : UIColor.red
            setNeedsDisplay()
        }
    }
    
    var hourValue: Float!
    
    @objc func openSelectionDialogue() {
        
    }
    
}

