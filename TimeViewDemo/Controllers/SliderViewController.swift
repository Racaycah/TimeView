//
//  SliderViewController.swift
//  TimeViewDemo
//
//  Created by Ata Doruk on 28.02.2018.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var timeRangeSlider: UISlider!
    @IBOutlet weak var timeAmountSlider: UISlider!
    
    var timeBars: [TimeBar]!
    var timePeriod: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeRangeSlider.minimumValue = Float(timeBars.first!.hourValue)
        timeRangeSlider.maximumValue = Float(timeBars.last!.hourValue)
        
        timeAmountSlider.minimumValue = 0
        timeAmountSlider.maximumValue = timePeriod
    }

    @IBAction func timeAmountChanged(_ sender: UISlider) {
        
    }
    
}
