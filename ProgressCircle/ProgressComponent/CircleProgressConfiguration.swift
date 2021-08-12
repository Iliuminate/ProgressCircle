//
//  CircleProgressConfiguration.swift
//  ProgressCircle
//
//  Created by Carlos Diaz on 13/07/21.
//

import Foundation

struct CircleProgressConfiguration {

    let circleFillColor: String
    let circleLineWidth: CFloat
    let circleStrokeColor: String
    let circleStrokePercentColor: String
    let circleStrokeEnd: CFloat
    let progressFillColor: String
    let progressLineWidth: CFloat
    let progressStrokeColor: String
    let progressStrokeEnd: CFloat
    let radius: CFloat
    let imageName: String

    static let defaultSettings: CircleProgressConfiguration = {
        return CircleProgressConfiguration(
            circleFillColor: "003F8C",
            circleLineWidth: 8.0,
            circleStrokeColor: "F2F2F2",
            circleStrokePercentColor: "B8EBD6",
            circleStrokeEnd: 1.0,
            progressFillColor: "FFFFFF",
            progressLineWidth: 8.0,
            progressStrokeColor: "1BC47C",
            progressStrokeEnd: 0.005,
            radius: 45,
            imageName: "prize")
    }()
    
}
