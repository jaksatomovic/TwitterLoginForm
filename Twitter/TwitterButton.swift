//
//  RChatButton.swift
//  RChat
//
//  Created by Max Alexander on 1/20/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//

import UIKit

class TwitterButton : UIButton {

    init(){
        super.init(frame: .zero)
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
        //layer.backgroundColor = TwitterConstants.Colors.twitterBlue.cgColor
        //setTitleColor(.white, for: .normal)
        //setTitleColor(.lightGray, for: .disabled)
        //titleLabel?.font = TwitterConstants.Fonts.boldFont
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
