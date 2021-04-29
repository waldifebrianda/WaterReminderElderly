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
    @IBOutlet weak var ReminderTimePick: UITextField!
    
    let timeHour = ["1 Hour","2 Hour","3 Hour"]
    var selectedTimeForAlarm : String = ""
    var timePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 16
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
        ReminderTimePick.inputView = timePickerView
        ReminderTimePick.placeholder = "Select Hour"
        //        ReminderTimePick.textAlignment = .center
    }
    
    @IBAction func buttonSaveall(_ sender: Any) {
        
        
        
        //buat muncul notifikasi
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.badge,.sound]) { grandted, error in
            if grandted{
                print("yay")
            }else{
                print("oh noo")
            }
        }
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Are you there?"
        content.body = "This Is your body speaking. Drink water!"
        content.sound = .default
        content.categoryIdentifier = "Alarm"
        content.userInfo = ["customData":"fizzbuzz"]
        
        //ini kondisi waktu nnti bisa disesuaikan, saat ini 1 jam 5 detik aja
        if selectedTimeForAlarm == "1 Hour"{
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }else if selectedTimeForAlarm == "2 Hour"{
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }else if selectedTimeForAlarm == "3 Hour"{
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
    }
    
}

//extension untuk picker view
extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return timeHour.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return timeHour[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        // TODO
        //        guard row < timeHour.count else {
        //            return
        //        }
        
        ReminderTimePick.text = timeHour[row]
        ReminderTimePick.resignFirstResponder()
        
        //get vallue for picker
        selectedTimeForAlarm = timeHour[row]
        
        print("apakah masuk \(selectedTimeForAlarm)")
        
    }
}
