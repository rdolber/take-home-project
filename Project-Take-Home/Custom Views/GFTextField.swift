//
//  GFTextField.swift
//  Project-Take-Home
//
//  Created by Ray Dolber on 8/24/22.
//

import UIKit

class GFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        layer.cornerRadius          = 10
            
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        
        placeholder                 = "Enter a username"
        returnKeyType               = .go
        
    }
}
