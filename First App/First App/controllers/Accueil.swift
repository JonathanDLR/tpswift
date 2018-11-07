//
//  Accueil.swift
//  First App
//
//  Created by JDLR on 08/10/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class Accueil: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var menuView: UIView!
    @IBOutlet var mailSend: UIButton!
    var hamburgerIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MISE EN PLACE DU SWIPE
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) { // ON FERME LE MENU SI SWIPE VERS LA GAUCHE
        if (sender.direction == .left) && hamburgerIsVisible {
            leadingC.constant = 0
            trailingC.constant = 0
            
            hamburgerIsVisible = false
            
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showExercice" {
            let exo = segue.destination as! Exercice
            exo.niveau = 1
        }
        else if segue.identifier == "showExerciceMedium" {
            let exo = segue.destination as! Exercice
        }
    }
    
    // MISE EN PLACE DU MFMAIL VIA L'ICONE
    internal func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mailTapped (_sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewContoller()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewContoller() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["test@test.fr"])
        mailComposerVC.setSubject("Envoi de mail")
        mailComposerVC.setMessageBody("Test de mail via cette super appli", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "envoi impossible", message: "Impossible d'envoyer un mail", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MISE EN PLACE DU BOUTON DOUVERTURE DU MENU
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
    
    // CLIC SUR LUN DES EXO POUR AFFICHER LA BONNE VUE
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


