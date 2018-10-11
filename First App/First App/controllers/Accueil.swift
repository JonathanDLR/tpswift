//
//  Accueil.swift
//  First App
//
//  Created by JDLR on 08/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit

class Accueil: UIViewController {
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var menuView: UIView!
    
    var hamburgerIsVisible = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExercice" {
            let exo = segue.destination as! Exercice
            exo.niveau = 1
        }
        else if segue.identifier == "showExerciceMedium" {
            let exo = segue.destination as! Exercice
        }
    }
    
    @IBAction func hamburgerTapped(_ sender: UIButton) {
        if !hamburgerIsVisible {
            leadingC.constant = 200
            trailingC.constant = 200
            
            hamburgerIsVisible = true
        }
        else {
            leadingC.constant = 0
            trailingC.constant = 0
            
            hamburgerIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func bExoClic(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let exo = storyboard.instantiateViewController(withIdentifier: "exercice") as! Exercice
        exo.calcul = CalculExercice(difficulte: sender.tag)
        navigationController?.show(exo, sender: self)
        leadingC.constant = 0
        trailingC.constant = 0
        hamburgerIsVisible = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.red
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.yellow]
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        
        navigationItem.backBarButtonItem?.title = "Home"
    }
}


