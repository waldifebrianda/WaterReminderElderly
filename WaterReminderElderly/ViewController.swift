//
//  ViewController.swift
//  WaterReminderElderly
//
//  Created by Waldi Febrianda on 26/04/21.
// adhe

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sudahMinumButton: UIButton!
    @IBOutlet weak var minButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var amountWaterDrinkLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var welcomeDateLabel: UILabel!
    @IBOutlet weak var totalWaterDrinkLabel: UILabel!
    
    var incrementWater = 0
    var totalAirDiMinum = 0
    var isComplete = true
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        //edit welcome label
        welcomeLabel.text = "Halo, Bro !"
        //edit welcome date label
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMMM yyyy"
        let dateString = dateFormatter.string(from:Date())
        welcomeDateLabel.text = dateString
        
        amountWaterDrinkLabel.text = String(incrementWater)
        
        
        sudahMinumButton.layer.cornerRadius = 16
        minButton.layer.cornerRadius = 16
        plusButton.layer.cornerRadius = 16
        
        sudahMinumButton.addTarget(self,
                                   action: #selector(tapButton), for: .touchUpInside)
        progressBar.progress = 0
        
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 12)
        
        
        plusButton.addTarget(self,
                             action: #selector(tapPlusButton), for: .touchUpInside)
        minButton.addTarget(self,
                            action: #selector(tapMinusButton), for: .touchUpInside)
    }
    
    @objc func tapMinusButton(){
        
        if incrementWater != 0 {
            incrementWater -=  50
            amountWaterDrinkLabel.text = String(incrementWater)
        }
        
        
    }
    @objc func tapPlusButton(){
        incrementWater += 50
        amountWaterDrinkLabel.text = String(incrementWater)
    }
    
    @objc func tapButton(){
        var persen : Float = Float((incrementWater))/(Float(2500))
        progressBar.progress += Float(persen)
        print(persen)
        totalAirDiMinum += incrementWater
        totalWaterDrinkLabel.text = "\(totalAirDiMinum)/2500 ml"
        
        
        if totalAirDiMinum >= 2500 && isComplete {
            isComplete = false
            
            let alert = UIAlertController(title: "Congratulations!", message: "You got your water target today!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    
    @objc private func didTapButton(){
        
        let tabBarVC = UITabBarController()
        let vc1 = HomeViewController()
        let vc2 = TipsViewController()
        let vc3 = SettingsViewController()
        
        //  vc1.title = "Home"
        //  vc2.title = "Tips"
        // vc3.title = "Settings"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        
        present(tabBarVC, animated: true)
        //lol
    }
}






