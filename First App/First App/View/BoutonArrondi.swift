//
//  BoutonArrondi.swift
//  First App
//
//  Created by JDLR on 20/09/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class BoutonArrondi: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5
        
        layer.borderColor = UIColor.red.cgColor
        
        layer.borderWidth = 2
        
        setTitleColor(UIColor.red, for: .normal)
    }
}
