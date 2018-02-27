//
//  TimeBar.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 27.02.2018.
//

import UIKit

//@objc enum Occupation: Int {
//    case available = 1
//    case occupied = 2
//}

@IBDesignable class TimeBar: UIView, UIGestureRecognizerDelegate {
    
//    @IBInspectable var availability: Occupation = .available {
//        didSet {
//            addOrRemoveGestureRecognizer()
//            setNeedsDisplay()
//        }
//    }
    
    @IBInspectable var isAvailable: Bool = true {
        didSet {
            if self.gestureRecognizers?.isEmpty ?? true {
                addTapGestureRecognizer()
            }
            self.backgroundColor = isAvailable ? UIColor.green : UIColor.red
            setNeedsDisplay()
        }
    }
    
    var touchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TimeBar.openSelectionDialogue))
    
    func addTapGestureRecognizer() {
        touchGestureRecognizer.delegate = self
        self.addGestureRecognizer(touchGestureRecognizer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isAvailable = !self.isAvailable
    }

//    private func addOrRemoveGestureRecognizer() {
//        guard self.isAvailable else { self.gestureRecognizers?.removeAll(); self.backgroundColor = UIColor.red; return }
//
//        self.backgroundColor = UIColor.green
//        self.gestureRecognizers?.removeAll()
//        let tgr = UITapGestureRecognizer(target: self, action: #selector(TimeBar.openSelectionDialogue))
//        self.gestureRecognizers?.append(tgr)
//    }
    
    @objc func openSelectionDialogue() {
        
//        switch self.availability {
//        case .available:
//            self.availability = .occupied
//        default:
//            self.availability = .available
//        }
    }
    
}

