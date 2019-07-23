//
//  SettingsViewController.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingPicker: UIPickerView!
    @IBOutlet weak var saveActionToolbar: UIToolbar!
    
    @IBOutlet weak var tableViewContainer: UIView!
    
    let tempUnits = ["Celsius", "Fahrenheit"]
    let pressureUnits = ["hPa", "inHg"]
    let speedUnits = ["km/h", "mph", "kts"]

    var selectedSetting: SettingOption = .none
    
    var tableViewController: SettingsTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingPicker.delegate = self
        settingPicker.dataSource = self
        settingPicker.isHidden = true
        
        saveActionToolbar.isHidden = true
    }
    
    func setupPicker(setting: SettingOption) {
        selectedSetting = setting
        
        settingPicker.reloadAllComponents()
        // get items to select from settings
        switch selectedSetting {
        case .temp:
            print(tempUnits.firstIndex(of: SettingsHelper.tempUnits)!)
            settingPicker.selectRow(tempUnits.firstIndex(of: SettingsHelper.tempUnits)!, inComponent: 0, animated: false)
        case .pressure:
            settingPicker.selectRow(pressureUnits.firstIndex(of: SettingsHelper.pressureUnits)!, inComponent: 0, animated: false)
        case .speed:
            print(speedUnits.firstIndex(of: SettingsHelper.speedUnits)!)
            settingPicker.selectRow(speedUnits.firstIndex(of: SettingsHelper.speedUnits)!, inComponent: 0, animated: false)
        default:
            return
        }
        
        settingPicker.isHidden = false
        saveActionToolbar.isHidden = false
        
    }
    
    @IBAction func doneBarButton_TouchUpInside(_ sender: UIBarButtonItem) {
        let row = settingPicker.selectedRow(inComponent: 0)
        settingPicker.isHidden = true
        saveActionToolbar.isHidden = true
        
        // save to settings
        switch selectedSetting {
        case .temp:
            SettingsHelper.tempUnits = tempUnits[row]
        case .pressure:
            SettingsHelper.pressureUnits = pressureUnits[row]
        case .speed:
            SettingsHelper.speedUnits = speedUnits[row]
        default:
            return
        }
        
        selectedSetting = .none
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tableViewContainerEmbedSegue" {
            if let tableVcon = segue.destination as? SettingsTableViewController {
                // get references to setting labels for use in picker view
                tableViewController = tableVcon
            }
        }
    }

}

class SettingsTableViewController : UITableViewController {
    @IBOutlet weak var tempUnitsSetting: UILabel!
    @IBOutlet weak var pressureUnitsSetting: UILabel!
    @IBOutlet weak var speedUnitsSetting: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        // remove empty cell separators
        tableView.tableFooterView = UIView(frame: .zero)
        
        tempUnitsSetting.text = SettingsHelper.tempUnits
        pressureUnitsSetting.text = SettingsHelper.pressureUnits
        speedUnitsSetting.text = SettingsHelper.speedUnits
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcon = self.parent as! SettingsViewController
        vcon.setupPicker(setting: SettingOption(rawValue: indexPath.row)!)
    }
    
}

extension SettingsViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch selectedSetting {
        case .temp:
            return tempUnits.count
        case .pressure:
            return pressureUnits.count
        case .speed:
            return speedUnits.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch selectedSetting {
        case .temp:
            return tempUnits[row]
        case .pressure:
            return pressureUnits[row]
        case .speed:
            return speedUnits[row]
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch selectedSetting {
        case .temp:
            tableViewController.tempUnitsSetting.text = tempUnits[row]
        case .pressure:
            tableViewController.pressureUnitsSetting.text = pressureUnits[row]
        case .speed:
            tableViewController.speedUnitsSetting.text = speedUnits[row]
        default:
            return
        }
    }
    
}

enum SettingOption: Int {
    case temp
    case pressure
    case speed
    case none
}
