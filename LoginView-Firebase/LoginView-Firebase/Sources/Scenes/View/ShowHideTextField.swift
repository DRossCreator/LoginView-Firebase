//
//  ShowHideTextField.swift
//  LoginView-Firebase
//
//  Created by Daniil Yarkovenko on 26.07.2022.
//

import UIKit

class UIShowHideTextField: UITextField {

    let rightButton  = UIButton(type: .custom)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    func commonInit() {
        rightButton.setImage(UIImage(systemName: "eye") , for: .normal)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        rightViewMode = .always
        rightView = rightButton
        isSecureTextEntry = true
    }

    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }

    func toggle() {
        isSecureTextEntry = !isSecureTextEntry
        if isSecureTextEntry {
            rightButton.setImage(UIImage(systemName: "eye") , for: .normal)
        } else {
            rightButton.setImage(UIImage(systemName: "eye.slash") , for: .normal)
        }
    }

}
