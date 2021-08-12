//
//  CircleProgressBarView.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 8/07/21.
//

import UIKit

protocol CircleProgressBarDelegate: AnyObject {
    func touchUp()
}

class CircleProgressBarView: UIView {
    
    // MARK: - Private properties -
    private var circleLayer = CAShapeLayer()
    private var circularPath: UIBezierPath!
    private var endPoint = CGFloat(3 * Double.pi / 2)
    private var icon: UIImageView!
    private var progressFillStroke: CGFloat = 0.005
    private var progressLayer = CAShapeLayer()
    private var radius: CGFloat = 0.0
    private var startPoint = CGFloat(-Double.pi / 2)
    private var shadowRadius: CGFloat = 8
    
    private var configuration: CircleProgressConfiguration? {
        didSet {
            guard let configuration = configuration else { return }
            radius = CGFloat(configuration.radius)
            progressFillStroke = CGFloat(configuration.progressStrokeEnd)
        }
    }
    
    // MARK: - Public properties -
    var delegate: CircleProgressBarDelegate?
    
    // MARK: - Lifecycle -
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure(with: CircleProgressConfiguration.defaultSettings)
    }
    
    // MARK: - Private methods -
    private func configureView() {
        guard let configuration = self.configuration else { return }
        circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: radius,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: true)
        
        createCircularLayer(path: circularPath, configuration: configuration)
        createCircularProgress(path: circularPath, configuration: configuration)
        setImage(name: configuration.imageName)
        addShadow(path: circularPath)
        addGesture()
    }
    
    private func createCircularLayer(path: UIBezierPath, configuration: CircleProgressConfiguration) {
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.hexStringToUIColor(hex: configuration.circleFillColor).cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = CGFloat(configuration.circleLineWidth)
        circleLayer.strokeEnd = CGFloat(configuration.circleStrokeEnd)
        circleLayer.strokeColor = progressFillStroke > 0.005 ?
            UIColor.hexStringToUIColor(hex: configuration.circleStrokePercentColor).cgColor :
            UIColor.hexStringToUIColor(hex: configuration.circleStrokeColor).cgColor
        layer.addSublayer(circleLayer)
    }
    
    private func createCircularProgress(path: UIBezierPath, configuration: CircleProgressConfiguration) {
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.hexStringToUIColor(hex: configuration.progressFillColor, alpha: 0.0).cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = CGFloat(configuration.progressLineWidth)
        progressLayer.strokeEnd = progressFillStroke
        progressLayer.strokeColor = UIColor.hexStringToUIColor(hex: configuration.progressStrokeColor).cgColor
        layer.addSublayer(progressLayer)
    }
    
    private func setImage(name: String) {
        if icon == nil {
            icon = UIImageView()
            icon.contentMode = .scaleToFill
            icon.center = self.center
            addSubview(icon)
        }
        icon.image = UIImage(named: name)
        icon.bounds.size = CGSize(width: radius, height: radius)
        self.bringSubviewToFront(icon)
    }
    
    private func addShadow(path: UIBezierPath) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.shadowPath = path.cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    private func addGesture() {
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(touchAction))
        self.addGestureRecognizer(touchGesture)
        icon.addGestureRecognizer(touchGesture)
    }
    
    @objc private func touchAction() {
        print("CEDA - touch")
        delegate?.touchUp()
    }
    
    // MARK: - Public methods -
    func configure(with data: CircleProgressConfiguration) {
        configuration = data
        configureView()
    }
    
    /// value: [0.0 - 1.0]
    func setProgressStroke(value: CGFloat) {
        guard let configuration = configuration else { return }
        circleLayer.strokeColor = progressFillStroke > 0.005 ?
            UIColor.hexStringToUIColor(hex: configuration.circleStrokePercentColor).cgColor :
            UIColor.hexStringToUIColor(hex: configuration.circleStrokeColor).cgColor
        progressLayer.strokeEnd = value
        progressFillStroke = value
    }
    
    func setPosition(_ position: CGPoint) {
        center = position
    }
    
    func setRadius(_ radius: CGFloat) {
        self.radius = radius
        configureView()
    }
    
    func setShadow(with elevation: CGFloat) {
        shadowRadius = elevation
        layer.shadowRadius = elevation
    }
}
