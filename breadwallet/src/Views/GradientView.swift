//
//  GradientView.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2016-11-22.
//  Copyright © 2016 breadwallet LLC. All rights reserved.
//

import UIKit

protocol GradientDrawable {
    func drawGradient(_ rect: CGRect)
}

extension GradientDrawable {
    func drawGradient(_ rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [UIColor.gradientStart.cgColor, UIColor.gradientEnd.cgColor] as CFArray
        let locations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.drawLinearGradient(gradient, start: .zero, end: CGPoint(x: rect.width, y: 0.0), options: [])
    }
}

class GradientView : UIView, GradientDrawable {
    override func draw(_ rect: CGRect) {
        guard !Environment.isIPhone4 || !Environment.isIPhone5 else {
            addFallbackImageBackground()
            return
        }
        drawGradient(rect)
    }

    private func addFallbackImageBackground() {
        let image = UIImageView(image: #imageLiteral(resourceName: "HeaderGradient"))
        image.contentMode = .scaleAspectFill
        addSubview(image)
        image.constrain(toSuperviewEdges: nil)
    }
}
