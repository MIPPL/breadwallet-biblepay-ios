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

extension UIView {
    func drawGradient(_ rect: CGRect) {
        guard !E.isIPhone4 && !E.isIPhone5 else {
            addFallbackImageBackground()
            return
        }
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colors = [UIColor.gradientStart.cgColor, UIColor.gradientEnd.cgColor] as CFArray
        let locations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.drawLinearGradient(gradient, start: .zero, end: CGPoint(x: rect.width, y: 0.0), options: [])
    }

    func drawEthGradient(_ rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()

        let start = UIColor(red: 60.0/255.0, green: 60.0/255.0, blue: 61.0/255.0, alpha: 1.0)
        let end = UIColor(red: 201.0/255.0, green: 157.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        let colors = [start.cgColor, end.cgColor] as CFArray
        let locations: [CGFloat] = [0.0, 1.0]
        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations) else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.drawLinearGradient(gradient, start: .zero, end: CGPoint(x: rect.width, y: 0.0), options: [])
    }

    private func addFallbackImageBackground() {
        let image = UIImageView(image: #imageLiteral(resourceName: "HeaderGradient"))
        image.contentMode = .scaleToFill
        addSubview(image)
        image.constrain(toSuperviewEdges: nil)
        sendSubview(toBack: image)
    }
}

class GradientView : UIView {
    override func draw(_ rect: CGRect) {
        drawGradient(rect)
    }
}
