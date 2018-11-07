//
//  VictoryView.swift
//  First App
//
//  Created by RCarter on 21/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class VictoryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let tabPoints = [
            CGPoint(x: 0.3945 * screenWidth, y: 0.2588 * screenHeight), //Point A
            CGPoint(x: 0.5028 * screenWidth, y: 0.3447 * screenHeight), //Point B
            CGPoint(x: 0.5651 * screenWidth, y: 0.2435 * screenHeight), //Point C
            CGPoint(x: 0.6220 * screenWidth, y: 0.3529 * screenHeight), //Point D
            CGPoint(x: 0.7761 * screenWidth, y: 0.2494 * screenHeight), //Point E
            CGPoint(x: 0.6660 * screenWidth, y: 0.4094 * screenHeight), //Point F
            CGPoint(x: 0.9174 * screenWidth, y: 0.4565 * screenHeight), //Point G
            CGPoint(x: 0.6477 * screenWidth, y: 0.4929 * screenHeight), //Point H
            CGPoint(x: 0.7046 * screenWidth, y: 0.6224 * screenHeight), //Point I
            CGPoint(x: 0.5394 * screenWidth, y: 0.5212 * screenHeight), //Point J
            CGPoint(x: 0.4092 * screenWidth, y: 0.6647 * screenHeight), //Point K
            CGPoint(x: 0.3615 * screenWidth, y: 0.5141 * screenHeight), //Point L
            CGPoint(x: 0.1174 * screenWidth, y: 0.5424 * screenHeight), //Point M
            CGPoint(x: 0.3229 * screenWidth, y: 0.4165 * screenHeight), //Point N
            CGPoint(x: 0.0881 * screenWidth, y: 0.3212 * screenHeight), //Point O
            CGPoint(x: 0.3927 * screenWidth, y: 0.3541 * screenHeight), //Point P
            CGPoint(x: 0.3945 * screenWidth, y: 0.2588 * screenHeight), //Point A
            CGPoint(x: 0.5028 * screenWidth, y: 0.3447 * screenHeight)//Et on termine au point B
        ]
        
        let chemin = CGMutablePath()
        
        chemin.move(to: CGPoint(x: tabPoints[0].x, y: tabPoints[0].y))
        
        for point in tabPoints {
            chemin.addLine(to: CGPoint(x: point.x, y: point.y))
        }
        
        let calque = CAShapeLayer()
        
        calque.fillColor = UIColor.white.cgColor
        calque.path = chemin
        calque.position = CGPoint(x: 0.0, y: 0.0)
        calque.frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
        calque.strokeColor = UIColor.red.cgColor
        calque.lineWidth = 10
        
        layer.addSublayer(calque)
        
        backgroundColor = UIColor.white
        
        let label = UILabel()
        label.text = "VICTORY!"
        label.font = UIFont(name: "Sunshine", size: 23)
        label.sizeToFit()
        label.frame.origin.y = 0.4112 * screenHeight
        label.frame.origin.x = 0.35 * screenWidth
        label.textColor = UIColor.red
        
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = CGFloat(0)
        }, completion: { _ in
            self.removeFromSuperview()
            return
        })
    }
}
