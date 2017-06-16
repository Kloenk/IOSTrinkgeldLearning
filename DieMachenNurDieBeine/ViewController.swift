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
    
    @IBAction func ausrechnenGedrückt(_ sender: Any) {
        RechnungsTextFeld.resignFirstResponder()
        TrinkGeldTextFeld.resignFirstResponder()
        
        let ausgabe = String(Double(changeToDot(RechnungsTextFeld.text!)!)! * Double(changeToDot(TrinkGeldTextFeld.text!)!)! / 100)
        
        print(ausgabe)
        Ausgabe.text = changeToComma(ausgabe)!
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/


}

