//
//  ViewController.swift
//  WeeklyDayFinder
//
//  Created by elina.zvargule on 26/08/2020.
//  Copyright © 2020 elina.zvargule. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //dayTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func handleCalculation(){
        let calendar = Calendar.current
        
        var dateComponent = DateComponents()
        
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text else {
            print("textField err")
            return
        }
        dateComponent.day = Int(day)
        dateComponent.month = Int(month)
        dateComponent.year = Int(year)
        
        guard let date = calendar.date(from: dateComponent) else {
            print("calendar.date err")
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date)
        _ = weekday.capitalized
        resultLabel.text = weekday
    }

    @IBAction func findWeekDayTapped(_ sender: Any) {
        handleCalculation()    }
    
}

