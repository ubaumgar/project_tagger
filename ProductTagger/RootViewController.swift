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
    
    var interests: [NSPopUpButton] = []
    var interestValues: [NSSlider] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        interests.append(interest1)
        interests.append(interest2)
        interests.append(interest3)
        interests.append(interest4)
        interests.append(interest5)
        interests.append(interest6)
        interests.append(interest7)
        interests.append(interest8)
        
        interestValues.append(interestValue1)
        interestValues.append(interestValue2)
        interestValues.append(interestValue3)
        interestValues.append(interestValue4)
        interestValues.append(interestValue5)
        interestValues.append(interestValue6)
        interestValues.append(interestValue7)
        interestValues.append(interestValue8)
    }
    
    override func awakeFromNib() {
        print("View controller instance with view: \(self.view)")
        
        manPercentTextField.stringValue = "50"
        womanPercentTextField.stringValue = "50"
        
        for popUpButton in interests {
            fillPopUpButton(button: popUpButton)
        }
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
        
        for i in 0...7 {
            if (interestValues[i].intValue > 0 && !(interests[i].selectedItem?.title.isEmpty)!) {
                resultString += String(format: ", %@:%d", (interests[i].selectedItem?.title)!, interestValues[i].intValue)
            }
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
 
        for i in 0...7 {
            interests[i].selectItem(at: 0)
            interestValues[i].intValue = 0
        }
        
        resultTextField.stringValue = ""
    }
}
