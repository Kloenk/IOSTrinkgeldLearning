//
//  ViewController.swift
//  DieMachenNurDieBeine
//
//  Created by Finn Behrens on 16.06.17.
//  Copyright © 2017 CrashCurs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var RechnungsTextFeld: UITextField!
    @IBOutlet weak var TrinkGeldTextFeld: UITextField!
    @IBOutlet weak var Ausgabe: UILabel!
    
    @IBOutlet weak var ErgebnisTextLable: UILabel!
    
    @IBAction func ausrechnenGedrückt(_ sender: Any) {
        RechnungsTextFeld.resignFirstResponder()
        TrinkGeldTextFeld.resignFirstResponder()
        
        let ausgabe = String(Double(changeToDot(RechnungsTextFeld.text!)!)! * Double(changeToDot(TrinkGeldTextFeld.text!)!)! / 100)
        
        print(ausgabe)
        ErgebnisTextLable.text = "Ergegnis"
        Ausgabe.text = changeToComma(GesamtPreis(ausgabe))!
        
    }
    
    //MAKR: , . changer
    func changeToDot(_ text: String!) -> String! {
        var v = text
        if text.contains(",") {
            v = String(text.characters.map {$0 == "," ? ".": $0})
            print(v!)
        }
        return v
    }
    
    func changeToComma(_ text: String!) -> String! {
        var v = text
        if text.contains(".") {
            v = String(text.map {$0 == "." ? ",": $0})
        }
        return(v)
    }
    
    func GesamtPreis(_ text: String!) -> String! {
        var v: String
        let Betrag = changeToDot(RechnungsTextFeld.text)
        v = String(Double(text)! + Double(Betrag!)!)
        return v
    }
    
    /*func removeUnusedDot(_ text: String!) -> String! {
        var v = text
        let index = v?.index(of: ".") ?? v?.endIndex
        if v?[index<v?.endIndex] == "0" {
            
        }
        return v
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Ausgabe.text = ""
        ErgebnisTextLable.text = ""
        
        RechnungsTextFeld.becomeFirstResponder()
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/


}

