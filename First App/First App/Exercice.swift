//
//  ViewController.swift
//  First App
//
//  Created by JDLR on 19/09/2018.
//  Copyright © 2018 JDLR. All rights reserved.
//

import UIKit

class Exercice: UIViewController, UITextFieldDelegate {
    @IBOutlet var tfNombreEntre: UITextField!
    @IBOutlet var bFin: UIButton!
    var modeAuto: Bool!
    @IBOutlet var slValue: UISlider!
    @IBOutlet var stepperValue: UIStepper!
    var coordonneeARetenir: CGPoint!
    var xDebutDeplacement: CGFloat!

    override func viewDidLoad() {
        tfNombreEntre.delegate = self
        
        slValue.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(longClicSurSlider)))
        stepperValue.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(glisserDeposerStepper)))
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicSurFin(sender: UIButton) {
        if let resultat = tfNombreEntre.text, resultat != "" {
            if Int(resultat) == 8 {
                alert("Bravo", message: "4 + 4 = 8\nC'est une bonne réponse")
            } else {
                alert("Faux", message: "Ce n'est pas la bonne réponse, réessayez!")
            }
        } else {
            alert("Champ vide", message: "Veuillez enrer une valeur")
        }
    }

    @IBAction func autoOnOff(sender: UISwitch) {
        modeAuto = sender.isOn
        bFin.isHidden = modeAuto
    }
    
    @IBAction func texteModifie(sender: UITextField) {
        if let resultat = sender.text {
            if let entier = Int(resultat) {
                if entier > 99 {
                    sender.text = "99"
                }
                slValue.setValue(Float(entier), animated: true)
                stepperValue.value = Double(entier)
            }
        }
    }
    
    @IBAction func sliderMove(sender: UISlider) {
        let entier = Int(sender.value)
        tfNombreEntre.text = "\(entier)"
        stepperValue.value = Double(entier)
    }
    
    @IBAction func stepperTouched(sender: UIStepper) {
        let entier = Int(sender.value)
        tfNombreEntre.text = "\(entier)"
        slValue.value = Float(entier)
    }
    
    @objc func longClicSurSlider(sender: UILongPressGestureRecognizer) {
        alert("Clic long", message: "Faire un long press ne sert à rien")
    }
    
    @objc func glisserDeposerStepper(sender: UIPanGestureRecognizer) {
        let step = sender.view!
        let coordonneesDuToucher = sender.location(in: self.view)
        var xPosition = CGFloat()
        var yPosition = CGFloat()
        var stepWidth = CGFloat()
        var stepHeight = CGFloat()
        
        switch sender.state {
        case .began:
            xPosition = step.frame.origin.x
            yPosition = step.frame.origin.y
            stepHeight = step.frame.size.height
            stepWidth = step.frame.size.width
        case .changed:
            step.center = coordonneesDuToucher
        case .ended:
            UIView.animate(withDuration: 0.5, animations: {
                step.frame = CGRect(x: xPosition, y: yPosition, width: stepWidth, height: stepHeight)}
            )
        case .possible:
            break
        case .cancelled:
            break
        case .failed:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if modeAuto {
            if let resultat = textField.text, resultat != "" {
                if Int(resultat) == 8 {
                    alert("Bravo", message: "4 + 4 = 8\nC'est une bonne réponse")
                } else {
                    alert("Faux", message: "Ce n'est pas la bonne réponse")
                }
            }
        }
        return true
    }
    
    func alert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

