//
//  RootViewController.swift
//  ProductTagger
//
//  Created by Siroop on 01.12.16.
//  Copyright © 2016 Siroop. All rights reserved.
//

import Cocoa

class RootViewController: NSViewController {

    @IBOutlet weak var womanPercentTextField: NSTextField!
    @IBOutlet weak var manPercentTextField: NSTextField!
    @IBOutlet weak var age0_1CheckBox: NSButton!
    @IBOutlet weak var age1_2CheckBox: NSButton!
    @IBOutlet weak var age3_4CheckBox: NSButton!
    @IBOutlet weak var age5_8CheckBox: NSButton!
    @IBOutlet weak var age9_11CheckBox: NSButton!
    @IBOutlet weak var age12_18CheckBox: NSButton!
    @IBOutlet weak var age19_35CheckBox: NSButton!
    @IBOutlet weak var age36_50CheckBox: NSButton!
    @IBOutlet weak var age50CheckBox: NSButton!
    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet weak var interest1: NSPopUpButton!
    @IBOutlet weak var interest2: NSPopUpButton!
    @IBOutlet weak var interest3: NSPopUpButton!
    @IBOutlet weak var interest4: NSPopUpButton!
    @IBOutlet weak var interest5: NSPopUpButton!
    @IBOutlet weak var interest6: NSPopUpButton!
    @IBOutlet weak var interest7: NSPopUpButton!
    @IBOutlet weak var interest8: NSPopUpButton!
    @IBOutlet weak var interestValue1: NSSlider!
    @IBOutlet weak var interestValue2: NSSlider!
    @IBOutlet weak var interestValue3: NSSlider!
    @IBOutlet weak var interestValue4: NSSlider!
    @IBOutlet weak var interestValue5: NSSlider!
    @IBOutlet weak var interestValue6: NSSlider!
    @IBOutlet weak var interestValue7: NSSlider!
    @IBOutlet weak var interestValue8: NSSlider!
    
    /*var interests: [NSPopUpButton]
    var interestValues: Array<NSSlider> = Array<NSSlider>()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        /*interests[0] = interest1
        interests[1] = interest2
        interests[2] = interest3
        interests[3] = interest4
        interests[4] = interest5
        interests[5] = interest6
        interests[6] = interest7
        interests[7] = interest8*/
        
    }
    
    override func awakeFromNib() {
        print("View controller instance with view: \(self.view)")
        
        manPercentTextField.stringValue = "50"
        womanPercentTextField.stringValue = "50"
        
        fillPopUpButton(button: interest1)
        fillPopUpButton(button: interest2)
        fillPopUpButton(button: interest3)
        fillPopUpButton(button: interest4)
        fillPopUpButton(button: interest5)
        fillPopUpButton(button: interest6)
        fillPopUpButton(button: interest7)
        fillPopUpButton(button: interest8)
    }
    
    func fillPopUpButton(button: NSPopUpButton)
    {
        button.addItem(withTitle: "")
        button.addItem(withTitle: "gf_interest_artscrafts")
        button.addItem(withTitle: "gf_interest_bathtime")
        button.addItem(withTitle: "gf_interest_bedroomdecor")
        button.addItem(withTitle: "gf_interest_beauty")
        button.addItem(withTitle: "gf_interest_bikes")
        button.addItem(withTitle: "gf_interest_books")
        button.addItem(withTitle: "gf_interest_cinema")
        button.addItem(withTitle: "gf_interest_cooking")
        /*button.addItem(withTitle: "gf_interest_education") (NOT USED ANYMORE!)*/
        button.addItem(withTitle: "gf_interest_electronics")
        button.addItem(withTitle: "gf_interest_fashion")
        button.addItem(withTitle: "gf_interest_feeding")
        button.addItem(withTitle: "gf_interest_games")
        button.addItem(withTitle: "gf_interest_gaming")
        button.addItem(withTitle: "gf_interest_gardening")
        button.addItem(withTitle: "gf_interest_homedecor")
        button.addItem(withTitle: "gf_interest_healthfitness")
        button.addItem(withTitle: "gf_interest_jewellery")
        button.addItem(withTitle: "gf_interest_learning")
        button.addItem(withTitle: "gf_interest_lifestyle")
        button.addItem(withTitle: "gf_interest_music")
        button.addItem(withTitle: "gf_interest_outdoor")
        button.addItem(withTitle: "gf_interest_party")
        button.addItem(withTitle: "gf_interest_pets")
        button.addItem(withTitle: "gf_interest_photography")
        button.addItem(withTitle: "gf_interest_puzzles")
        button.addItem(withTitle: "gf_interest_sport")
        button.addItem(withTitle: "gf_interest_toys")
        button.addItem(withTitle: "gf_interest_travel")
    }
    
    @IBAction func generateString(_ sender: Any) {
        print("Generate string")
        
        var resultString = "";
        resultString += "gf_gender_male:";
        resultString += manPercentTextField.stringValue
        resultString += ", gf_gender_female:";
        resultString += womanPercentTextField.stringValue
        
        if (age0_1CheckBox.state == NSOnState) { resultString += ", gf_age:0_1" }
        if (age1_2CheckBox.state == NSOnState) { resultString += ", gf_age:1_2" }
        if (age3_4CheckBox.state == NSOnState) { resultString += ", gf_age:3_4" }
        if (age5_8CheckBox.state == NSOnState) { resultString += ", gf_age:5_8" }
        if (age9_11CheckBox.state == NSOnState) { resultString += ", gf_age:9_11" }
        if (age12_18CheckBox.state == NSOnState) { resultString += ", gf_age:12_18" }
        if (age19_35CheckBox.state == NSOnState) { resultString += ", gf_age:19_35" }
        if (age36_50CheckBox.state == NSOnState) { resultString += ", gf_age:36_50" }
        if (age50CheckBox.state == NSOnState) { resultString += ", gf_age:50" }
        
        if (interestValue1.intValue > 0 && !(interest1.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest1.selectedItem?.title)!, interestValue1.intValue)
        }
        if (interestValue2.intValue > 0 && !(interest2.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest2.selectedItem?.title)!, interestValue2.intValue)
        }
        if (interestValue3.intValue > 0 && !(interest3.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest3.selectedItem?.title)!, interestValue3.intValue)
        }
        if (interestValue4.intValue > 0 && !(interest4.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest4.selectedItem?.title)!, interestValue4.intValue)
        }
        if (interestValue5.intValue > 0 && !(interest5.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest5.selectedItem?.title)!, interestValue5.intValue)
        }
        if (interestValue6.intValue > 0 && !(interest6.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest6.selectedItem?.title)!, interestValue6.intValue)
        }
        if (interestValue7.intValue > 0 && !(interest7.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest7.selectedItem?.title)!, interestValue7.intValue)
        }
        if (interestValue8.intValue > 0 && !(interest8.selectedItem?.title.isEmpty)!) {
            resultString += String(format: ", %@:%d", (interest8.selectedItem?.title)!, interestValue8.intValue)
        }
        
        resultTextField.stringValue = resultString
        NSPasteboard.general().clearContents()
        NSPasteboard.general().setString(resultString, forType: NSStringPboardType)
    }
    
    @IBAction func resetSelection(_ sender: Any) {
        manPercentTextField.stringValue = "50"
        womanPercentTextField.stringValue = "50"

        age0_1CheckBox.state = NSOffState
        age1_2CheckBox.state = NSOffState
        age3_4CheckBox.state = NSOffState
        age5_8CheckBox.state = NSOffState
        age9_11CheckBox.state = NSOffState
        age12_18CheckBox.state = NSOffState
        age19_35CheckBox.state = NSOffState
        age36_50CheckBox.state = NSOffState
        age50CheckBox.state = NSOffState
        
        interest1.selectItem(at: 0)
        interest2.selectItem(at: 0)
        interest3.selectItem(at: 0)
        interest4.selectItem(at: 0)
        interest5.selectItem(at: 0)
        interest6.selectItem(at: 0)
        interest7.selectItem(at: 0)
        interest8.selectItem(at: 0)
        
        interestValue1.intValue = 0
        interestValue2.intValue = 0
        interestValue3.intValue = 0
        interestValue4.intValue = 0
        interestValue5.intValue = 0
        interestValue6.intValue = 0
        interestValue7.intValue = 0
        interestValue8.intValue = 0
        
        resultTextField.stringValue = ""
    }
    
}
