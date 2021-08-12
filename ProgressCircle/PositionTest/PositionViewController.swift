//
//  PositionViewController.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 19/07/21.
//

import UIKit

class PositionViewController: UIViewController {

    var objView: CircleProgressBarView?
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var leftContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCircleView()
    }

    private func addCircleView() {
        guard objView == nil else { return }
        objView = CircleProgressBarView()
        guard let objView = objView else { return }
        objView.configure(with: CircleProgressConfiguration.defaultSettings)
        objView.center = leftContainer.center
        self.view.addSubview(objView)
    }

    
    @IBAction func buttonActioin(_ sender: Any) {
        addCircleView()
    }
}
