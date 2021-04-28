//
//  ViewController.swift
//  WaterReminderElderly
//
//  Created by Waldi Febrianda on 26/04/21.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Tambah Air", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 9
        button.layer.masksToBounds = true
        return button
    }()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 220, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
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
    }
}

class HomeViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
       // title = "Home"
    }
}

class TipsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //title = "Tips"
    }
}

class SettingsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        //title = "Settings"
    }
}

