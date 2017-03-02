//
//  RTextField.swift
//  RChat
//
//  Created by Max Alexander on 2/1/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//
import UIKit

class TwitterTextField: UITextField {

    var insetX: CGFloat = 0
    var insetY: CGFloat = 0

    init(){
        super.init(frame: .init())
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func commonInit(){
        font = TwitterConstants.Fonts.regularFont
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}
