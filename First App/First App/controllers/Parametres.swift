//
//  Parametres.swift
//  First App
//
//  Created by JDLR on 08/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class Parametres: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "Contact us"
            }
            else {
                cell.textLabel?.text = "Vist our website"
            }
        }
        else {
            cell.textLabel?.text = "Get more infos"
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Get some help"
        case 1:
            return "Informations"
        default:
            return ""
        }
    }
}
