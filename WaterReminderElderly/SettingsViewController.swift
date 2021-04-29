//
//  SettingsViewController.swift
//  WaterReminderElderly
//
//  Created by Waldi Febrianda on 28/04/21.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController{
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        saveButton.layer.cornerRadius = 16
    }
}
