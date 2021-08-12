//
//  TestViewController.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 12/07/21.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var viewContainer: UIView!
    @IBOutlet weak var sliderX: UISlider!
    @IBOutlet weak var sliderY: UISlider!
    
    var objPosition: CGPoint = CGPoint.zero
    var objView: CircleProgressBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func AddView(_ sender: Any) {
        guard objView == nil else { return }
        objView = CircleProgressBarView(frame: CGRect.zero)
        guard let objView = objView else { return }
        let settings = CircleProgressConfiguration.defaultSettings
        objView.configure(with: settings)
        objView.center = viewContainer.center
        viewContainer.addSubview(objView)
    }
    
    @IBAction func sliderX(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("sliderX: \(currentValue)")
        objPosition.x = currentValue
        guard let objView = objView else { return }
        let position = CGPoint(
            x: viewContainer.center.x * objPosition.x,
            y: viewContainer.center.y * objPosition.y)
        objView.setPosition(position)
    }
    
    
    @IBAction func sliderY(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("sliderY: \(currentValue)")
        objPosition.y = currentValue
        guard let objView = objView else { return }
        let position = CGPoint(
            x: viewContainer.center.x * objPosition.x,
            y: viewContainer.center.y * objPosition.y)
        objView.setPosition(position)
    }
    
    @IBAction func sliderRadius(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("sliderRadius: \(currentValue)")
        guard let objView = objView else { return }
        objView.setRadius(currentValue)
    }
    
    @IBAction func sliderContent(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("value: \(currentValue)")
        guard let objView = objView else { return }
        objView.setProgressStroke(value: currentValue)
    }
    
    @IBAction func sliderShadow(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("value: \(currentValue)")
        guard let objView = objView else { return }
        objView.setShadow(with: currentValue * 20)
    }
    
}
