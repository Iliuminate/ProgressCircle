//
//  ViewController.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 8/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var contentViewTest: UIView!
    
    
    var circularProgressBarView: CircleProgressBarView!
    var circularViewDuration: TimeInterval = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        setUpCircularProgressBarView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addContentViewTest()
    }
    
    /// Tap on view controller
    @objc func handleTap() {
    }
    
    func setUpCircularProgressBarView() {
        let configuration = CircleProgressConfiguration.defaultSettings
        circularProgressBarView = CircleProgressBarView(frame: CGRect(x: 0, y: 0, width: 160, height: 160))
        circularProgressBarView.configure(with: configuration)
        
        circularProgressBarView.center = view.center
        view.addSubview(circularProgressBarView)
    }
    
    private func addContentViewTest() {
        let testPedro = CircleProgressBarView()
        testPedro.configure(with: CircleProgressConfiguration.defaultSettings)
        testPedro.center = contentViewTest.center
        view.addSubview(testPedro)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let currentValue = CGFloat(sender.value)
        print("value: \(currentValue)")
        circularProgressBarView.setProgressStroke(value: currentValue)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.navigationController?.pushViewController(TestViewController(), animated: true)
    }
    
    @IBAction func locationAction(_ sender: Any) {
        self.navigationController?.pushViewController(PositionViewController(), animated: true)
    }
    
}

