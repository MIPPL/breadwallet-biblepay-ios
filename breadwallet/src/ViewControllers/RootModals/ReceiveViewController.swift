//
//  ReceiveViewController.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2016-11-30.
//  Copyright © 2016 breadwallet LLC. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController {

    private let qrCode = UIImageView()
    private let address = UILabel(font: .customBody(size: 16.0))
    private let share = ShadowButton(title: NSLocalizedString("Share", comment: "Share button label"), type: .tertiary, image: #imageLiteral(resourceName: "Share"))
    private let border = UIView()
    private let request = ShadowButton(title: NSLocalizedString("Request an Amount", comment: "Request button lable"), type: .secondary)
    private let qrSize: CGFloat = 186.0
    private let shareHeight: CGFloat = 32.0

    override func viewDidLoad() {
        addSubviews()
        addConstraints()
        setStyle()
    }

    private func addSubviews() {
        view.addSubview(qrCode)
        view.addSubview(address)
        view.addSubview(share)
        view.addSubview(border)
        view.addSubview(request)
    }

    private func addConstraints() {
        qrCode.constrain([
                qrCode.constraint(.width, constant: qrSize),
                qrCode.constraint(.height, constant: qrSize),
                qrCode.constraint(.top, toView: view, constant: C.padding[2]),
                qrCode.constraint(.centerX, toView: view)
            ])
        address.constrain([
                address.constraint(toBottom: qrCode, constant: C.padding[1]),
                address.constraint(.centerX, toView: view)
            ])
        share.constrain([
                share.constraint(toBottom: address, constant: C.padding[2]),
                share.constraint(.centerX, toView: view),
                share.constraint(.width, constant: qrSize),
                share.constraint(.height, constant: shareHeight)
            ])
        border.constrain([
                border.constraint(.width, toView: view),
                border.constraint(toBottom: share, constant: C.padding[2]),
                border.constraint(.centerX, toView: view),
                border.constraint(.height, constant: 1.0)
            ])
        request.constrain([
                request.constraint(toBottom: border, constant: C.padding[3]),
                request.constraint(.leading, toView: view, constant: C.padding[2]),
                request.constraint(.trailing, toView: view, constant: -C.padding[2]),
                request.constraint(.height, constant: C.Sizes.buttonHeight)
            ])
    }

    private func setStyle() {
        qrCode.image = #imageLiteral(resourceName: "TempQRCode")
        address.text = "9T2K3qb24sD45214439v1Ve7swF43Y2134"
        address.textColor = .grayTextTint
        border.backgroundColor = .secondaryBorder
    }

}

extension ReceiveViewController: ModalDisplayable {
    var modalTitle: String {
        return NSLocalizedString("Receive", comment: "Receive modal title")
    }

    var modalSize: CGSize {
        return CGSize(width: view.frame.width, height: 400.0)
    }

    var isFaqHidden: Bool {
        return false
    }
}
