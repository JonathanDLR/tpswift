//
//  CalculExercice.swift
//  First App
//
//  Created by JDLR on 08/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class CalculExercice {
    var consigne: String
    var titre: String
    var reponse: Int
    
    init(difficulte: Int) {
        switch difficulte {
        case 2:
            consigne = "8 x 7"
            titre = "Niveau moyen"
            reponse = 56
            break
        default:
            consigne = "4 + 4"
            titre = "Niveau facile"
            reponse = 8
            break
        }
    }
}
