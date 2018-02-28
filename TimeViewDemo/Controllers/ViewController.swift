//
//  ViewController.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 27.02.2018.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var timeView: TimeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        timeView.subviews.forEach { $0.removeFromSuperview() }
        let sv = UIStackView(arrangedSubviews: timeView.bars)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        //sv.frame = self.frame
        
        for i in 0..<sv.arrangedSubviews.count {
            guard i % (timeView.hourSection) == 0 && i != 0 else { continue }
            if #available(iOS 11.0, *) {
                sv.setCustomSpacing(3, after: sv.arrangedSubviews[i])
            } else {
                // Fallback on earlier versions
                continue
            }
        }
        
        let tgr = UITapGestureRecognizer(target: self, action: #selector(ViewController.openSlider))
        tgr.delegate = self
        
        sv.arrangedSubviews.forEach { (bar) in
            bar.addGestureRecognizer(tgr)
            bar.isExclusiveTouch = true
        }
        
        timeView.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.leftAnchor.constraint(equalTo: timeView.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: timeView.rightAnchor).isActive = true
        sv.topAnchor.constraint(equalTo: timeView.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: timeView.bottomAnchor).isActive = true
        sv.isUserInteractionEnabled = true
        //sv.isExclusiveTouch = false
    }
    
    @objc func openSlider() {
        performSegue(withIdentifier: "showSliderSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSliderSegue" {
            let vc = segue.destination as! SliderViewController
            vc.timePeriod = Float(timeView.timePeriod)
            vc.timeBars = timeView.bars
        }
    }
    

}

